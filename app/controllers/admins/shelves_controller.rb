class Admins::ShelvesController < ApplicationController
  def index
  	@shelves = Shelf.all
  end
  def show
  end
end
