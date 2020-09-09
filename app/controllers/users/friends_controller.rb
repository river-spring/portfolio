class Users::FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@friends = Friend.where(user_id: current_user.id).where(friend_flag: true).or(Friend.where(friend_id: current_user.id).where(friend_flag: true))
  	@my_requests = Friend.where(user_id: current_user.id).where(friend_flag: false)
  	@other_requests = Friend.where(friend_id: current_user.id).where(friend_flag: false)
    @recommendations = Recommendation.where(friend_id: current_user.id)
  end
  def create
  	request = current_user.request(user)
  	request.friend_flag = "false"
  	request.save
    redirect_to users_user_path(user), notice: "フレンドリクエストを送りました！"
  end
  def update
  	request = Friend.find(params[:id])
  	request.update(friend_flag: "true")
    flash[:notice] = "フレンドリクエストを許可しました！"
  	redirect_back(fallback_location: root_path)
  end
  def destroy
  	request = current_user.refuse(user)
  	if request.nil?
  		request = Friend.find(params[:id])
  	end
  	request.destroy
    flash[:alert] = "取り消しました！"
    redirect_back(fallback_location: root_path)
  end
  private
  def user
  	User.find(params[:user_id])
  end
end
