Rails.application.routes.draw do
  
  resources :actors, only: [:index, :create, :show, :destroy]
  resources :reviews, only: [:show, :create, :destroy]
  resources :movies, only: [:index, :show, :create, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
