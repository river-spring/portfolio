class Users::ShelvesController < ApplicationController
  def show
    @shelf = Shelf.find(params[:id])
    @productions = Production.where(shelf_id: @shelf.id)
  end

  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf.user_id = current_user.id
    if @shelf.save
      redirect_to users_shelf_path(@shelf.id)
    else
      render :new
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
  end

  def update
    @shelf = Shelf.find(params[:id])
    if @shelf.update(shelf_params)
      flash[:notice] = "変更しました"
      redirect_to users_shelf_path(@shelf.id)
    else
      render :edit
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    shelf.destroy
    redirect_to users_user_path(current_user)
  end
  private
  def shelf_params
    params.require(:shelf).permit(:name, :shelf_image, :outline)
  end
end
