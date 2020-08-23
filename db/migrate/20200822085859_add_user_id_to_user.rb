class AddUserIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :string
    add_column :users, :name, :string
    add_column :users, :profile_image, :string
    add_column :users, :mypage_image, :string
    add_column :users, :introduction, :text
    add_column :users, :status, :boolean
    add_column :users, :deleted_at, :datetime
  end
end
