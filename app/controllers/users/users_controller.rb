class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friend = Friend.find_by(user_id: params[:id],friend_id: current_user.id)
    if @friend.nil?
      @friend = Friend.find_by(user_id: current_user.id, friend_id: params[:id])
    end
    @shelves = Shelf.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_user_path(current_user),notice: "設定を変更しました。"
    else
      render :edit
    end
  end

  def edit_password
  end

  def password_update
   if current_user.update(password_params)
    sign_in(current_user, bypass: true)
    redirect_to  users_user_path(current_user),notice: "パスワードを変更しました。"
   else
    flash.now[:alert] = "パスワードが不正な値です。"
    render :edit_password
   end
  end

  def history
    @recommendation = Recommendation.where(user_id: current_user.id)
  end

  def quit
  end

  def quit_update
    customer = current_customer
    customer.destroy
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
