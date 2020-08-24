class RemoveShelfImageFromShelves < ActiveRecord::Migration[5.2]
  def change
    remove_column :shelves, :shelf_image, :string
  end
end
