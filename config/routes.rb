Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Routes pour les utilisateurs
  resources :users, only: [] do
    resources :rentings, only: [:index]
  end

  # Routes pour les chambres et les réservations
  resources :cars do
    resources :rentings
  end
  resources :rentings
end
