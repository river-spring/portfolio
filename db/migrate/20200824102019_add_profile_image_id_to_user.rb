class AddProfileImageIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :mypage_image_id, :string
  end
end
