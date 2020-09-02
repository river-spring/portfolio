class RemoveUserIdToRecommendation < ActiveRecord::Migration[5.2]
  def change
  	remove_column :recommendations, :user_id, :integer
  end
end
