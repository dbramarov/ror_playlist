class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def require_login
	  	if(!session[:user_id])
	  		redirect_to '/main'
	  	end
  	end
end
