require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject { page }

  describe "index page" do
    let(:user) { FactoryGirl.create(:user, is_admin: true)}
    before(:each) do
      log_in user
      visit users_path
    end

    it { should have_title("All users")}
    it { should have_content('All users')}

    describe "pagination" do

      before(:all) { 20.times { FactoryGirl.create(:user)}}
      # after(:all) { User.delete_all}

      # it { should have_selector(".pagination")}
      it "should list each user" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end
    end

    describe "delete links" do
      # it { should_not have_link('delete')}

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:user, is_admin: true)}
        before do
          log_in admin
          visit users_path
        end

        it { should have_link('delete', href: user_path(User.first))}
        it "should be able to delete another user" do
          expect do
            click_link('delete', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin))}
      end
    end

  end

  describe "signup page" do
    before { visit signup_path}

    it {should have_content('Sign up')}
    it {should have_title(full_title('Sign up'))}
  end
=begin
  describe "profile page", type: :feature do
    let!(:user) { FactoryGirl.create(:user)}
    before { visit user_path(user)}

    it { should have_content(user.name)}
    it {should have_title(user.name)}
  end
=end
  describe "signup" do
    before { visit signup_path}
    let(:submit ) { "Create my account"}

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name" , with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
      end

      it "should create a user" do
        expect {click_button 'Create my account'}.to change(User, :count).by(1)
      end

=begin
      describe "after saving the user" do
        before { click_button 'Create my account'}
        let(:user) { User.find_by(email: "user@example.com")}

        it { should have_link("Log out")}
        it { should have_title(user.name)}
        it { should have_selector('div.alert.alert-success', text: 'Welcome')}
      end
=end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user)}
    before do
      log_in(user)
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Update profile")}
      it { should have_title("Edit user")}
    end

    describe "with invalid information" do
      before { click_button "Save changes"}

      it { should have_content('error')}
    end

    describe "with valid information" do
      let(:new_name) { "New Name"}
      let(:new_email) { "new@email.com"}
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Password confirmation", with: user.password
        click_button 'Save changes'
      end

      it { should have_title(new_name)}
      it { should_not have_selector('div.alert.alert-error')}
      it { should have_link('Log out', href: logout_path)}
      specify { (expect(user.reload.name)).to eq new_name}
      specify { (expect(user.reload.email)). to eq new_email  }
    end
  end
end
