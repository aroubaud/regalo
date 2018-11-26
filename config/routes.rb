Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  mount Facebook::Messenger::Server, at: 'bot'

  resources :gifts, only:[:show]

  resources :orders, only: [:show, :new, :create] do
    resources :payments, only: [:new, :create]
  end
end
