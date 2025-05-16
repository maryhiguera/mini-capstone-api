Rails.application.routes.draw do
  get "/first_p" => "products#first_product"
  get "/all_p" => "products#all_products"
  get "/second_p" => "products#second_product"
end
