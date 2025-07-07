Rails.application.routes.draw do
  get "/products/:id" => "products#show"
  get "/products" => "products#index"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#delete"

  get "/images" => "images#index"
  get "/images/:id" => "images#show"
  post "/images" => "images#create"

  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/signup" => "users#create"
  patch "/users" => "users#update"

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"
end
