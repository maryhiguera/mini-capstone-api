Rails.application.routes.draw do
  get "/first_p" => "products#show"
  get "/all_p" => "products#all_products"
end
