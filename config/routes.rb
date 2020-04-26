Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :new, :create, :destroy]

  get 'download/:file', to: "cours#download", as: 'download'
  resources :cours

  get 'authorization', to: "cours_users#authorization", as: 'authorization'
  resources :cours_users, only: [:index]

  # API routing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cours, only: [ :index ]
      resources :users, only: [ :index ]
      resources :cours_users, only: [ :index, :create ]
    end
  end
end
