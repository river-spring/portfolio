class AddShelfImageIdToShelf < ActiveRecord::Migration[5.2]
  def change
    add_column :shelves, :shelf_image_id, :string
  end
end
