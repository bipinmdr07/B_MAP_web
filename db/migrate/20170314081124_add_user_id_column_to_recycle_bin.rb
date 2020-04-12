class AddUserIdColumnToRecycleBin < ActiveRecord::Migration[5.2]
  def change
    add_column :recycle_bins, :user_id, :integer
  end
end
