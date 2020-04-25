Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :new, :create, :destroy]

  get 'download/:file', to: "cours#download", as: 'download'
  resources :cours

  get 'authorization', to: "cours_users#authorization", as: 'authorization'
  resources :cours_users, only: [:index]
end
