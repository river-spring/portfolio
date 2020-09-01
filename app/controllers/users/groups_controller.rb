class Users::GroupsController < ApplicationController
  def index
    @groups = GroupUser.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
    @friends = Friend.where(user_id: current_user.id).where(friend_flag: true).or(Friend.where(friend_id: current_user.id).where(friend_flag: true))
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
