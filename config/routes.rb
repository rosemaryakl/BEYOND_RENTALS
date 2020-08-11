Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] do
    resources :bookings, only: [:show, :index]
  end
  resources :planets do
    resources :bookings do
      member do
        patch :accept
      end
    end
  end
  resources :planets do
    resources :booking, only: [:new, :create]
  end
end
