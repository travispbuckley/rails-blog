Rails.application.routes.draw do
	root 'posts#index'

	resources :posts, :comments
		# This creates the 7 restful routes for the post controller, index, show, create, update, delete, etc
	resources :users, only: [:new, :create, :show]
	resources :sessions, only: [:new, :create, :destory]



end
