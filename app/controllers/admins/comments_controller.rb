class Admins::CommentsController < ApplicationController
  def index
    @production = Production.find(params[:production_id])
    @comments = Comment.where(production_id: params[:production_id])
  end

  def check
  	@comments = Comment.all
  	# 感情スコアがなければ挿入する
  	@comments.each do |comment|
  		if comment.score.nil?
	  		comment.score = Language.get_data(comment.comment)
	  		comment.update(score: comment.score)
	  	end
  	end
  end

  def comments_check
  	@comments = Comment.where(score: -1.0..-0.1)
  	flash[:notice] = 'ネガティブコメントを抽出しました。'
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to request.referer, alert: 'コメントを削除しました。'
  end
end
