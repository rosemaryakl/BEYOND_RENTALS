Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :planets do
    resources :bookings do
      member do
        patch :accept
      end
    end
  end
end
