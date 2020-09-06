class Users::RecommendationsController < ApplicationController
  def show
  	@recommendation = Recommendation.find(params[:id])
  	@user = User.find_by(id: params[:user_id])
  end

  def new
  	@friend = User.find(params[:user_id])
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
  	recommendation.friend_id = params[:user_id]
  	recommendation.user_id = current_user.id
  	recommendation.save
    redirect_to users_user_recommendation_path(user_id: params[:user_id], id: recommendation.id), notice: "オススメを作成しました！"
  end

  def update
  	recommendation = Recommendation.find(params[:id])
  	recommendation.update!(recommendation_update_params)
    flash[:notice] = "オススメコメントを追加しました。"
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	recommendation = Recommendation.find(params[:id])
  	recommendation.destroy
  	redirect_to  users_user_friends_path(current_user), alert: "オススメを削除しました。"
  end
  private
  def recommendation_params
    params.permit(:title, :outline, :image_id, :shelf_id, :release_date)
  end
  def recommendation_update_params
  	params.require(:recommendation).permit(:comment)
  end
end
