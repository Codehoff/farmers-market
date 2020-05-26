Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:index]

  #shall we also allow for a :destroy resource with orders??
end
