# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

product = Product.new(name: "desk", price: 100, image_url: "desk", description: "Wood 32in")
product.save

i = 0
5.times do
  product = Product.new(name: "chair", price: "50#{i}", image_url: "chair", description: "tall and black")
  product.save
  i += 1
end

