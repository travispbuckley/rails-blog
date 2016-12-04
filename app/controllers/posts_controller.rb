class PostsController < ApplicationController
	# Show all blog posts
	def index
		@posts = Post.all
		# When called upon, rails will look for a folder in the views called posts, with an erb file called index.html.erb
	end
	# Show a single post '/posts/:id'
	def show
		@post = Post.find(params[:id])
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

	def post_params
		params.require(:post).permit(:title, :body, :author_id)
	end
end
