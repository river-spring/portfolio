class RemoveUserIdFromFriendRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :friend_requests, :user_id, :integer
    remove_column :friend_requests, :friend_id, :integer
  end
end
