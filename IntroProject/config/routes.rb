Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index] 
  end 

  resources :artworks, only: [:show, :update, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]

end
