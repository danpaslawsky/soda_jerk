Rails.application.routes.draw do
  
  root "application#index"
  
  resources :users, only: [:show, :new, :create]
  
  
  resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
