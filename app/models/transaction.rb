# model for handeling the transaction information
class Transaction < ActiveRecord::Base
  belongs_to :capital
  validates :cash_type, presence: true
  # validates :amount, presence: true
  validates :date, presence: true
end
