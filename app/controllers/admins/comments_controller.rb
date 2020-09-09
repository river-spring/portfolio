class Admins::CommentsController < ApplicationController
  def index
    @production = Production.find(params[:production_id])
    @comments = Comment.where(production_id: params[:production_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admins_shelf_production_comments_path(shelf_id: params[:shelf_id], production_id: comment.production_id), alert: 'コメントを削除しました。'
  end
end
