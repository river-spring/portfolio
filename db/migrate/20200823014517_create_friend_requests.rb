class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: { to_table: :users }

      t.timestamps
      t.index %i[user_id friend_id], unique: true
    end
  end
end
