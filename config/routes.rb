Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show, :create, :update, :destroy ]
      resources :animes, only: [:index, :show]
      resources :watchlist_entries, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
