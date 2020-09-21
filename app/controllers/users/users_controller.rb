class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest, only: %i[edit update edit_password password_update quit quit_update]

  # ゲストログインは編集・退会を行えない
  def check_guest
    redirect_to users_user_path(current_user), alert: 'ゲストユーザーにはない権限です。' if current_user.email == 'guest@example.com'
  end

  def show
    @user = User.find(params[:id])
    @friend = Friend.find_by(user_id: params[:id], friend_id: current_user.id)
    @friend = Friend.find_by(user_id: current_user.id, friend_id: params[:id]) if @friend.nil?
    @shelves = Shelf.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_user_path(@user), alert: '不正なアクセスです！' if @user != current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_user_path(current_user), notice: '設定を変更しました。'
    else
      render :edit
    end
  end

  def edit_password
    @user = current_user
    if @user.update(user_params)
      redirect_to users_user_path(current_user), notice: '設定を変更しました。'
    else
      render :edit
    end
  end

  def password_update
    if current_user.update(password_params)
      sign_in(current_user, bypass: true)
      redirect_to users_user_path(current_user), notice: 'パスワードを変更しました。'
    else
      flash.now[:alert] = 'パスワードが不正な値です。'
      render :edit_password
    end
  end

  def history
    @recommendation = Recommendation.where(user_id: current_user.id)
  end

  def quit
    @user = User.find(params[:id])
  end

  def quit_update
    user = current_user
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_id, :introduction, :profile_image, :mypage_image, :email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
