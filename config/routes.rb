Rails.application.routes.draw do
  resources :gifts
  resources :santas
  resources :draws
  resources :participants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/gifts-wishlist/:participant_id", to: "gifts#wishlist_items"
  # Defines the root path route ("/")
  # root "articles#index"
end
