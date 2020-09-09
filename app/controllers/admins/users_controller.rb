class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@users = User.with_deleted.all
  end

  def show
  	@user = User.with_deleted.find(params[:id])
  end

  def edit
  	@user = User.with_deleted.find(params[:id])
  end

  def update
  	@user = User.with_deleted.find(params[:id])
  	if @user.update(user_params)
  		redirect_to admins_user_path(@user), notice: "変更を保存しました！"
  	else
  		render :edit
  	end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :user_id, :introduction, :profile_image, :mypage_image, :email, :deleted_at)
  end
end
