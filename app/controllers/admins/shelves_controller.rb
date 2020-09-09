class Admins::ShelvesController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@shelves = Shelf.all
  end
  def show
  	@shelf = Shelf.find(params[:id])
  	@productions = Production.where(shelf_id: @shelf.id)
  end
  def edit
  	@shelf = Shelf.find(params[:id])
  end
  def update
  	@shelf = Shelf.find(params[:id])
  	if @shelf.update(shelf_params)
  		redirect_to admins_shelf_path(@shelf.id),notice: "棚の変更を保存しました！"
  	else
  		render :edit
  	end
  end
  def destroy
  	shelf = Shelf.find(params[:id])
  	shelf.destroy
  	redirect_to admins_shelves_path, alert: "棚を削除しました！"
  end
  private
  def shelf_params
    params.require(:shelf).permit(:name, :shelf_image, :outline, :group_id)
  end
end
