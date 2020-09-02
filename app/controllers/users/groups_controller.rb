class Users::GroupsController < ApplicationController
  def index
    @groups = GroupUser.where(user_id: current_user.id)
  end
  def show
    @group = Group.find(params[:id])
    @shelves = Shelf.where(group_id: params[:id])
    @members = GroupUser.where(group_id: params[:id])
  end

  def new
    @group = Group.new
    @friends = Friend.where(user_id: current_user.id).where(friend_flag: true).or(Friend.where(friend_id: current_user.id).where(friend_flag: true))
  end

  def create
    params = group_params
    group_user_ids = params.delete('group_users')
    @group = Group.new(params)
    @group.users << ( User.where(id: group_user_ids) + [current_user] )
    if @group.save
      redirect_to users_groups_path
    else
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  def group_params
    params.require(:group).permit(:name, :image, :outline, group_users: [])
  end
end
