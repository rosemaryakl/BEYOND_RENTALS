Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planets
  resources :users, only: [:show]
  resources :bookings
end
