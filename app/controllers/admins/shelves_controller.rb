class Admins::ShelvesController < ApplicationController
  def index
  	@shelves = Shelf.all
  end
  def show
  	@shelf = Shelf.find(params[:id])
  	@productions = Production.where(shelf_id: @shelf.id)
  end
end
