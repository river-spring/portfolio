class Admins::CommentsController < ApplicationController
  def index
    @production = Production.find(params[:production_id])
    @comments = Comment.where(production_id: params[:production_id])
  end

  def check
    @comments = Comment.all
    # 感情スコアがなければ挿入する
    # @comments.each do |comment|
    #   if comment.score.nil?
    #     comment.score = Language.get_data(comment.comment)
    #     comment.update(score: comment.score)
    #   end
    # end
  end

  def comments_check
    @comments = Comment.where(score: -1.0..-0.1)
    # "ネガティブコメントを抽出"ボタンを押した時のみフラッシュメッセージを表示
    require 'uri'
    uri = URI.parse(request.referer)
    flash[:notice] = 'ネガティブコメントを抽出しました。' if uri.path == '/admins/comments/check'
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_back(fallback_location: root_path, alert: 'コメントを削除しました。')
    else
      redirect_back(fallback_location: root_path, alert: '削除に失敗しました。')
  end
  end
end
