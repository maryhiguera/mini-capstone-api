Rails.application.routes.draw do
  get "/products/:id" => "products#show"
  get "/products" => "products#index"
end
