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
    @friends = Friend.where(user_id: current_user.id).where(friend_flag: true).or(Friend.where(friend_id: current_user.id).where(friend_flag: true))
    if @group.save
      redirect_to users_group_path(@group), notice: "グループを作成しました。"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    friends = Friend.where(user_id: current_user.id).where(friend_flag: true).pluck(:friend_id)
    friends_user = Friend.where(friend_id: current_user.id).where(friend_flag: true).pluck(:user_id)
    friends = friends.push(friends_user).flatten!
    group_user = GroupUser.where(group_id: params[:id]).pluck(:user_id)
    friends = friends - group_user
    @friends = User.where(id: friends)
  end

  def update
    @group = Group.find(params[:id])
    friends = Friend.where(user_id: current_user.id).where(friend_flag: true).pluck(:friend_id)
    friends_user = Friend.where(friend_id: current_user.id).where(friend_flag: true).pluck(:user_id)
    friends = friends.push(friends_user).flatten!
    group_user = GroupUser.where(group_id: params[:id]).pluck(:user_id)
    friends = friends - group_user
    @friends = User.where(id: friends)
    params = group_params
    group_user_ids = params.delete('group_users')
    @group.users << User.where(id: group_user_ids)
    if @group.update(params)
      redirect_to users_group_path(@group), notice: "グループの編集を保存しました。"
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to  users_groups_path(anchor: "group_index"), alert: "グループを解散しました。"
  end
  def group_params
    params.require(:group).permit(:name, :image, :outline, group_users: [])
  end
end
