Rails.application.routes.draw do
	root 'posts#index'

	resources :posts, :comments
		# This creates the 7 restful routes for the post controller, index, show, create, update, delete, etc
	resources :users, only: [:new, :create, :show]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # you can nest routes to achieve a route like so:
  	# '/admin/articles/:id'
  	# namespace :admin do
 			# resources :articles, :comments
		# end
	# controller function would be in the admins controller



end
