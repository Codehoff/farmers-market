Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :orders, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :orders, only: [:destroy, :index, :edit, :update]
end
