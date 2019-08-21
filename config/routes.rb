Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms do 
    resources :messages    
  end
  
  resources :users do
    resources :rooms 
  end

end
