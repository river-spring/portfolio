class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.text :outline
      t.string :shelf_image

      t.timestamps
    end
  end
end
