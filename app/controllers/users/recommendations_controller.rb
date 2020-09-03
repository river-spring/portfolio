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
  	recommendation = Recommendation.new(recommendation_params)
  	friend = Friend.find_by(user_id: params[:user_id], friend_id: current_user.id)
  	if friend.nil?
  		friend = Friend.find_by(user_id: current_user.id, friend_id:params[:user_id])
  	end
  	recommendation.friend_id = friend.id
  	byebug
  	recommendation.save
    redirect_to users_user_recommendation_path(user_id: params[:user_id], id: recommendation.id), notice: "オススメを作成しました！"
  end

  def destroy
  end
  private
  def recommendation_params
    params.permit(:title, :outline, :image_id, :shelf_id, :release_date)
  end
end
