class Users::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "設定を変更しました"
      redirect_to users_user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
  end

  def quit
  end

  def quit_update
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_id, :introduction, :profile_image, :mypage_image, :email)
  end
end
