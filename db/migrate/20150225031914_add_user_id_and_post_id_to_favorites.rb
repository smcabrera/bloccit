class AddUserIdAndPostIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :user_id, :integer
    add_column :favorites, :post_id, :integer
    add_index :favorites, :user_id
    add_index :favorites, :post_id
  end
end

