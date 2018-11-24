Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  mount Facebook::Messenger::Server, at: 'bot'

  resources :gifts, only:[:show]
end
