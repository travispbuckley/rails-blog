class SessionsController < ApplicationController
	# before_filter :authorize

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: login_params)

		if @user && @user.authenticate(login_params)
			session[:user_id] = @user.id 
			redirect_to '/'
		else
			flash[:alert] = "Error updating post!"
			render :new			
		end
	end

	def destroy

	end

	private

		def login_params
		params.require(:login).permit(:email, :password)
	end

end