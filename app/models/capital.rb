# model for handeling the the payable and receivable data
class Capital < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50}
  validates :total_amount, presence: true
  validates :user_id, presence: true
end
