class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	

	private
 
	def require_login
		unless !session[:current_user_id].nil?
			flash[:error] = "You must be logged in to access this section"
			redirect_to login_pages_path # halts request cycle
		end
	end
end
