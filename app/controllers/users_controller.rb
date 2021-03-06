# controller for handeling users login
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
    if current_user.nil?
      redirect_to root_url
      return
    end
    redirect_to root_url and return unless (current_user.is_admin || current_user?(@user))
  end

  def new
    @user = User.new
    @account = Account.new()
    @user.account = @account
  end

  def index
    @user = User.all
    redirect_to root_url and return unless current_user.is_admin?
    @user = User.where(activated: true).paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    @account = Account.new
    @account.update_attribute(:net_total_addition, @account.addition_holiday + @account.addition_overtime + @account.addition_miscellaneous)
    @account.update_attribute(:net_total_deduction, @account.company_deduction_absent + (@account.company_deduction_wtax * @account.salary / 100) + @account.deduction_late + @account.deduction_loan + @account.deduction_miscellaneous)
    @account.update_attribute(:net_pay, @account.salary + @account.net_total_addition - @account.net_total_deduction)
    @user.account = @account
    if @user.save
      # UserMailer.account_activation(@user).deliver_now
      # flash[:success] = 'Please check your email to activate your account'
      log_in @user
      flash[:success] = 'Welcome to B-MAP'
      redirect_to @user # root_url
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    @user.update_attribute(:updated, true)
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    curr_u = current_user
    recycle = RecycleBin.new(corr_id: params[:id], table_name: "users", user_id: curr_u.id)
    recycle.save

    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :is_admin,
                                 :image,
                                 :address,
                                 :bank_name,
                                 :account_number,
                                 :nationality,
                                 :mobile,
                                 :home,
                                 :work)
  end

  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url, notice: 'Please log in'
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.is_admin?
  end
end
