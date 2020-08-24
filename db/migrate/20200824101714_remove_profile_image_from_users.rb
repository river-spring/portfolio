class RemoveProfileImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_image, :string
    remove_column :users, :mypage_image, :string
  end
end
