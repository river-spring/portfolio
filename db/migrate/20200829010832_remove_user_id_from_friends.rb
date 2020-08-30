class RemoveUserIdFromFriends < ActiveRecord::Migration[5.2]
  def change
    remove_column :friends, :user_id, :integer
    remove_column :friends, :friend_id, :integer
  end
end
