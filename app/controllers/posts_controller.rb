class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	before_filter :authorize

	skip_before_filter :authorize, :only => [:index, :show]

	# Show all blog posts
	def index
		@posts = Post.all
		@post = Post.new
		# When called upon, rails will look for a folder in the views called posts, with an erb file called index.html.erb
	end
	# Show a single post '/posts/:id'
	def show

	end

	# This is the GET route for a new post
	def new 
		@post = Post.new
	end

	# Post a new blog
	def create
		@post = Post.new(post_params) # calls the method down below where i state my params
		if @post.save
			flash[:notice] = "Successfully created post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error creating new post!"
			render :new
		end
	end

	def edit
		if logged_in?
			render :edit
		else
			redirect_to '/'
		end
	end

	def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end		
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :author_id)
	end
end
