Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'

  resources :messages, only: [:show, :create]
  resources :rooms
  resources :users, except: [:index, :new]
  get '/home', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/search', to: 'users#search' 
  get '/settings', to: 'users#show'


end
