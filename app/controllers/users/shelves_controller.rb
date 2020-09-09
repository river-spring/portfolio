class Users::ShelvesController < ApplicationController
  before_action :authenticate_user!
  def show
    @shelf = Shelf.find(params[:id])
    @group_users = GroupUser.where(group_id: @shelf.group_id).pluck(:user_id)
    @productions = Production.where(shelf_id: @shelf.id)
  end

  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    if @shelf.group_id.nil?
      @shelf.user_id = current_user.id
      if @shelf.save
        redirect_to users_shelf_path(@shelf.id),notice: "棚を作成しました！"
      else
        render :new
      end
    else
      if @shelf.save
        redirect_to users_shelf_path(@shelf.id),notice: "棚を作成しました！"
      else
        render :new
      end
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
    group_users = GroupUser.where(group_id: @shelf.group_id).pluck(:user_id)
    if @shelf.user_id == current_user.id || group_member group_users.include?(current_user.id)
    else
      redirect_to users_user_path(current_user), alert: "不正なアクセスです！"
    end
  end

  def update
    @shelf = Shelf.find(params[:id])
    if @shelf.update(shelf_params)
      redirect_to users_shelf_path(@shelf.id), notice: "棚の変更を保存しました！"
    else
      render :edit
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    if shelf.group_id.nil?
      shelf.destroy
      redirect_to users_user_path(current_user), alert: "棚を削除しました！"
    else
      shelf.destroy
      redirect_to users_group_path(shelf.group_id), alert: "棚を削除しました！"
    end
  end
  private
  def shelf_params
    params.require(:shelf).permit(:name, :shelf_image, :outline, :group_id)
  end
end
