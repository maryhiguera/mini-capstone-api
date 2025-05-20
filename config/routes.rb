Rails.application.routes.draw do
  get "/products/:id" => "products#show"
  get "/products" => "products#index"
  post "/products" => "products#create"
end
