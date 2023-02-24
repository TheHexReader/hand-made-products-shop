Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  get "/profile", to: 'user#show'

  resources :products, only: %i[new show create destroy]

  post "/buy/:id", to: 'products#buy', as: 'product_buy'
end
