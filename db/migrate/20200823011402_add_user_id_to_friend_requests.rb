class AddUserIdToFriendRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :friends, :user, foreign_key: true
    add_reference :friends, :friend, foreign_key: {to_table: :users}
  end
end
