class Admins::GroupsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@groups = Group.all
  end
  def show
  	@group = Group.find(params[:id])
  	@shelves = Shelf.where(group_id: params[:id])
  end
  def edit
  	@group = Group.find(params[:id])
  end
  def update
  	@group = Group.find(params[:id])
  	if @group.update(group_params)
  		redirect_to admins_group_path(@group), notice: "グループの編集を保存しました。"
  	else
  		render :edit
  	end
  end
  def destroy
  	group = Group.find(params[:id])
  	group.destroy
  	redirect_to admins_groups_path, alert: "グループを解散しました。"
  end
  private
  def group_params
    params.require(:group).permit(:name, :image, :outline)
  end
end
