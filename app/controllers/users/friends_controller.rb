class Users::FriendsController < ApplicationController
  def index
  	@friends = Friend.where(user_id: current_user.id).where(friend_flag: true).or(Friend.where(friend_id: current_user.id).where(friend_flag: true))
  	@my_requests = Friend.where(user_id: current_user.id).where(friend_flag: false)
  	@other_requests = Friend.where(friend_id: current_user.id).where(friend_flag: false)
  end
  def create
  	request = current_user.request(user)
  	request.friend_flag = "false"
  	if request.save
  		flash[:success] = "フレンドリクエストを送りました。"
      	redirect_to users_user_path(user)
    else
        flash.now[:alert] = "フレンドリクエストに失敗しました。"
        redirect_to users_user_path(user)
    end
  end
  def update
  	request = Friend.find(id: params[:id])
  	if request.update(friend_flag: "true")
  		flash[:success] = "フレンドリクエストを許可しました。"
  		redirect_to users_user_path(current_user)
  	else
  		flash.now[:alert] = "エラーが発生しました。"
        redirect_to users_user_path(current_user)
  	end
  end
  def destroy
  	request = current_user.refuse(user)
  	if request.destroy
  	  	flash[:success] = 'フレンドリクエストを取消ました。'
      	redirect_to users_user_friends_path(current_user)
    else
      	flash.now[:alert] = 'リクエストの取り消しに失敗しました'
      	redirect_to users_user_friends_path(current_user)
    end
  end
  private
  def user
  	User.find(params[:user_id])
  end
end
