class SearchsController < ApplicationController
  def search
  	@user = params[:user]
  	@word = params[:word]
  	if
  		@user.nil?
  	else
  		@users = User.search(@user, @word)
  	end
  end
end
