class SearchsController < ApplicationController
  def search
  	@user = params[:user]
  	@word = params[:word]
  	# 検索ワードや検索カテゴリ選択がされていない時
  	if @user == "" && @word == ""
  		flash[:alert] = "・ユーザー名/ユーザーIDを選択して下さい。・検索したいワードを入力して下さい。"
  		render :search
  	elsif @user == ""
  		flash[:alert] = "・ユーザー名/ユーザーIDを選択して下さい。"
  		render :search
  	elsif @word == ""
  		flash[:alert] = "・検索したいワードを入力して下さい。"
  		render :search
  	end
  	if
  		@user.nil?
  	else
  		@users = User.search(@user, @word)
  	end
  end
end
