Rails.application.routes.draw do
  
  root to: 'application#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :users
  
  
  resources :cocktail_ingredients
  resources :ingredients
  resources :cocktails 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
