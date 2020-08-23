class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.integer :shelf_id
      t.string :title
      t.text :outline
      t.string :production_image

      t.timestamps
    end
  end
end
