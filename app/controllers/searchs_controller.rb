class SearchsController < ApplicationController
  before_action :authenticate_user!, only: [:search]
  before_action :authenticate_admin!, only: [:admin_search]
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
  def admin_search
    @category = params[:category]
    @word = params[:word]
    # 検索ワードや検索カテゴリ選択がされていない時
    if @category == "" && @word == ""
      flash[:alert] = "・検索カテゴリを選択して下さい。・検索したいワードを入力して下さい。"
      render :search
    elsif @category == ""
      flash[:alert] = "・検索カテゴリを選択して下さい。"
      render :search
    elsif @word == ""
      flash[:alert] = "・検索したいワードを入力して下さい。"
      render :search
    end
    if @category == "user_name" ||  @category == "user_id"
      @results = User.admin_search(@category, @word)
    elsif @category == "group_name"
      @results = Group.admin_search(@category, @word)
    elsif @category == "shelf_name"
      @results = Shelf.admin_search(@category, @word)
    end
  end
end
