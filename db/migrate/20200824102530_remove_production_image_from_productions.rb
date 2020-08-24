class RemoveProductionImageFromProductions < ActiveRecord::Migration[5.2]
  def change
    remove_column :productions, :production_image, :string
  end
end
