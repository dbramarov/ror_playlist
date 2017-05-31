class CountsController < ApplicationController
	before_action :require_login
  def add
  	@sng = Song.find(params[:id])
  	user = User.find(session[:user_id])

   	Song.find(params[:id]).increment!(:count)

	y = Fave.where(user: user,song: @sng)

		if y.empty? == false
			x = Fave.where(user:user,song: @sng).first.id
			Fave.find(x).increment!(:faves_count)
			redirect_to :back
		else
			Fave.create(user: user, song: @sng, faves_count:1)
			redirect_to :back
		end

  	end
end
