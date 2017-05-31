class SongsController < ApplicationController
	before_action :require_login
  def index
  	@user = User.find(session[:user_id])
  	@songs = Song.all
  end
  def add
  	@song = Song.create(title: params[:title], artist: params[:artist], count: 0)
  	if @song.valid? 
  		redirect_to "/songs"
  	else
  		flash[:errors] = @song.errors.full_messages
  		redirect_to :back
  	end
  end
  def show
  	@user = User.find(session[:user_id])
  	@song = Song.find(params[:id])
  	@userfavs = Fave.select('*').joins(:song).joins(:user).where(song_id:params[:id])
  end
end
