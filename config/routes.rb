Rails.application.routes.draw do
  # user management
  devise_for :users

  # root path 
  root 'home#index'

  # guest login 
  post '/users/guest_sign_in', to: 'home#guest_sign_in'

  # route for users
  resources :users do
    # route for movies
    resources :movies, only: %i(create edit update destroy)
  end


end
