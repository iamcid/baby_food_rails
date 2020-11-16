Rails.application.routes.draw do

  get '/', to: 'sessions#welcome'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :reviews
  resources :baby_foods do
    resources :reviews, only: [:new, :index]
  end
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
