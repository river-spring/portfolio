class AddreLeaseDateIdToRecommendation < ActiveRecord::Migration[5.2]
  def change
  	add_column :recommendations, :release_date, :string
  end
end
