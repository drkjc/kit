Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/settings', to: 'users#settings'

  get '/auth/:provider/callback' => 'sessions#create'

  resources :messages, only: [:show, :create]
  

  resources :rooms
  resources :users
  get '/home', to: 'users#index'
  get '/search', to: 'users#search' 


end
