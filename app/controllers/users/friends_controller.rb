class Users::FriendsController < ApplicationController
  def index
  	@friends = Friend.where(user_id: current_user.id)
  end
  def create
  end
  def destroy
  end
end
