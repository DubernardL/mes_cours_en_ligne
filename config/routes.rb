Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :new, :create, :edit, :destroy]
  resources :cours, only: [:index, :new, :create]
end
