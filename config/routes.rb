Rails.application.routes.draw do
  resources :baskets_products, only: [:create, :destroy]
  # get "/baskets_products", to: 'baskets_products#create'
  root "baskets#create"
end
