module PostsHelper

	def logged_in?
		return true if session[:user_id]
	end

	def current_user
		User.find(session[:user_id])
	end
	
end
