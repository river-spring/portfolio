class AddfriendFlagToFriend < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :friend_flag, :boolean
  end
end
