Rails.application.routes.draw do

	resources :users
	resources :rides
	resources :attractions
	resources :sessions

	root to: 'static#index'

	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	get '/logout', to: 'sessions#destroy'

	post '/rides/new', to: 'rides#new'

end