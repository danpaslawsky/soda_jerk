Rails.application.routes.draw do
  
  root "application#index"

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout/:id', to: 'sessions#destroy', as: 'logout'

  resources :users [:show, :new, :create, :destroy]
  
  
  resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
