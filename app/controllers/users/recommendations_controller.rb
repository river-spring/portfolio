class Users::RecommendationsController < ApplicationController
  def show
  end

  def new
  	@genre = params[:genre]
    title = params[:title]
    uri = URI.parse(URI.encode("https://api.themoviedb.org/3/search/#{@genre}?api_key=#{ENV['TMDB_KEY']}&language=ja-JA&query=#{title}&page=1&include_adult=false"))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    res = http.start {
      http.get(uri.request_uri)
    }
    @productions = JSON.parse(res.body)
  end

  def create
  	recommendation = Recommendation.create!(recommendation_params)
    redirect_to users_recommendation_path(recommendation), notice: "オススメを作成しました！"
  end

  def destroy
  end
  private
  def recommendation_params
    params.permit(:title, :outline, :image_id, :shelf_id, :release_date)
  end
end
