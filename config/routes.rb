Rails.application.routes.draw do
  resources :gifts
  resources :santas
  resources :draws
  resources :participants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/gifts-wishlist/:participant_id", to: "gifts#wishlist_items"
  get "/draws-by-participant/:participant_id", to: "draws#draws_by_participant"
  # Defines the root path route ("/")
  # root "articles#index"
end
