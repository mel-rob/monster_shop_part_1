Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"

  get "/merchants", to: "merchants#index"
  get "/merchants/new", to: "merchants#new"
  get "/merchants/:id", to: "merchants#show"
  post "/merchants", to: "merchants#create"
  get "/merchants/:id/edit", to: "merchants#edit"
  patch "/merchants/:id", to: "merchants#update"
  patch "/merchants/:id/disable", to: "merchants#update_disabled"
  delete "/merchants/:id", to: "merchants#destroy"

  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
  get "/items/:id/edit", to: "items#edit"
  patch "/items/:id", to: "items#update"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"
  get "/reviews/:id/edit", to: "reviews#edit"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  patch "/cart", to: "cart#increment_decrement"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"

  get "/orders/new", to: "orders#new"
  post "/users/:id/orders", to: "orders#create"
  get "/profile/orders/:order_id", to: "orders#show"
  patch "/orders/:id", to: 'orders#update'
  get '/profile/orders', to: 'orders#index'

  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get "/profile", to: "users#show"
  get "/profile/edit", to: "users#edit"
  patch "/profile", to: "users#update"
  get "/profile/edit_password", to: "users#edit_password"
  patch "/profile/edit_password", to: "users#update_password"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :merchant do
    get '/', to: 'dashboard#index'
    get '/items', to: 'items#index'

    resources :orders, only: [:show]
  end

  namespace :admin do
    get '/', to: 'dashboard#index'
    get '/merchants/:id', to: 'merchants#show'
  end
end
