class Users::FriendsController < ApplicationController
  def index
  	@friends = Friend.where(user_id: current_user.id).where(friend_flag: true).or(Friend.where(friend_id: current_user.id).where(friend_flag: true))
  	@my_requests = Friend.where(user_id: current_user.id).where(friend_flag: false)
  	@other_requests = Friend.where(friend_id: current_user.id).where(friend_flag: false)
  end
  def create
  end
  def update
  end
  def destroy
  end
end
