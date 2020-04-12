class AddUserIdColumnToRecycleBin < ActiveRecord::Migration[6.0]
  def change
    add_column :recycle_bins, :user_id, :integer
  end
end
