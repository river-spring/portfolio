class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :title
      t.text :outline
      t.string :image_id
      t.text :comment

      t.timestamps
    end
  end
end
