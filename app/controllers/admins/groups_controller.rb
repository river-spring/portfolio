class Admins::GroupsController < ApplicationController
  def index
  	@groups = Group.all
  end
  def show
  	@group = Group.find(params[:id])
  	@shelves = Shelf.where(group_id: params[:id])
  end
end
