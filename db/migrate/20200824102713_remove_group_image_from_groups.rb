class RemoveGroupImageFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :group_image, :string
  end
end
