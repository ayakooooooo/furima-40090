Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items, only: :index
  root to: 'items#index'
  # Defines the root path route ("/")
  # root "articles#index"
end