class Users::ProductionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @production = Production.find(params[:id])
    @shelf = Shelf.find(params[:shelf_id])
    @group_users = GroupUser.where(group_id: @shelf.group_id).pluck(:user_id)
    @comment = Comment.new
  end

  def new
    @production = Production.new
    @shelf = Shelf.find(params[:shelf_id])
  end

  def search
    @shelf = Shelf.find(params[:shelf_id])
    @genre = params[:genre]
    title = params[:title]
    # 検索ワードやジャンル選択がされていない時
    if @genre == "" && title == ""
      redirect_to new_users_shelf_production_path(@shelf), alert: "・検索したいジャンルを選択して下さい。・検索したいワードを入力して下さい。"
    elsif @genre == ""
      redirect_to new_users_shelf_production_path(@shelf), alert: "・検索したいジャンルを選択して下さい。"
    elsif title == ""
      redirect_to new_users_shelf_production_path(@shelf), alert: "・検索したいワードを入力して下さい。"
    end
    # APIに関する記述
    uri = URI.parse(URI.encode("https://api.themoviedb.org/3/search/#{@genre}?api_key=#{ENV['TMDB_KEY']}&language=ja-JA&query=#{title}&page=1&include_adult=false"))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.start {
      http.get(uri.request_uri)
    }
    @productions = JSON.parse(res.body)
  end

  def create
    @shelf = Shelf.find(params[:shelf_id])
    Production.create!(production_params)
    redirect_to users_shelf_path(@shelf), notice: "作品を棚に追加しました！"
  end

  def destroy
    production = Production.find(params[:id])
    shelf = Shelf.find(params[:shelf_id])
    production.destroy
    redirect_to users_shelf_path(shelf), alert: "作品を削除しました。"
  end
  private
  def production_params
    params.permit(:title, :outline, :image_id, :shelf_id, :release_date)
  end
end
