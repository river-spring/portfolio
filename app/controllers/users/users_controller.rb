class Users::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shelves = Shelf.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
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
end
