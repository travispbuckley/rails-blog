class UsersController < ApplicationController
	

	# Create a new user, use a form
	def new
		@user = User.new
	end

	# POST request to save new user
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "User Signup Successful!"
			redirect_to '/'
		else
			flash[:alert] = "Error creating user"
			render :new
		end
	end

	# Show a users profile page
	def show

	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end	

end