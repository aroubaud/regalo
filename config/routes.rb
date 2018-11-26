Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  mount Facebook::Messenger::Server, at: 'bot'

  resources :gifts, only:[:show] do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]
  end
end
