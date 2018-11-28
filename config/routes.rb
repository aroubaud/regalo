Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  mount Facebook::Messenger::Server, at: 'bot'

  resources :orders, only: [:show]

  resources :gifts, only:[:show] do
    resources :orders, only: [:new]
    resources :payments, only: [:create]
  end

  # resources :orders, only: [:show] do
  #   resources :payments, only: [:new, :create]
  # end
end
