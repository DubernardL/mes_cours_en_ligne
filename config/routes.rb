Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get 'contact', to: "pages#contact", as: 'contact'

  resources :users, only: [:index, :new, :create, :destroy]


  resources :cours do
    get 'download', to: "cours#download"
    get 'download_aditional_file/:file', to: "cours#download_aditional_file", as: 'download_aditional_file'
  end



  resources :cours_users, only: [:index, :new]

  # API routing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cours, only: [ :index ]
      resources :users, only: [ :index ]
      resources :cours_users, only: [ :index, :create, :destroy ]
    end
  end
end
