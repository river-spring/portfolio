class Admins::ProductionsController < ApplicationController
	def destroy
		production = Production.find(params[:production_id])
		production.destroy
		redirect_to admins_shelf_path(id: production.shelf_id), alert: "作品を削除しました。"
	end
end
