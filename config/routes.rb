Rails.application.routes.draw do
	root 'posts#index'

	resources :posts
		# This creates the 7 restful routes for the post controller, index, show, create, update, delete, etc
	resources :users
	resources :comments



end
