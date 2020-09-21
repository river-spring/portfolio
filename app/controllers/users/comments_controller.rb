class Users::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @production = Production.find(params[:production_id])
    @shelf = Shelf.find(params[:shelf_id])
    @group_users = GroupUser.where(group_id: @shelf.group_id).pluck(:user_id)
    @comment = Comment.new
    production_comment = current_user.comments.new(comment_params)
    production_comment.production_id = @production.id
    production_comment.score = Language.get_data(production_comment.comment)
    production_comment.save
  end

  def destroy
    @production = Production.find(params[:production_id])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
