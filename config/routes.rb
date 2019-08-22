Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  
  resources :rooms do 
    resources :messages    
  end

  resources :users do
    resources :rooms 
  end

end
