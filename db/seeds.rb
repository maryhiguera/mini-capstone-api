# # Create suppliers
# supplier1 = Supplier.create(name: "Amazon", email: "amazon@email.com", phone_number: "243222342")
# supplier2 = Supplier.create(name: "Think Geek", email: "thinkgeek@email.com", phone_number: "5432534")

# # Create products and their associated images
# product1 = Product.create({
#   supplier_id: supplier2.id,
#   name: "Lightsaber",
#   price: 270.10,
#   description: "Part laser, part samurai sword, all awesome. The lightsaber is an elegant weapon for a more civilized age, not nearly as clumsy as a blaster"
# })
# Image.create(url: "http://25.media.tumblr.com/d2456964024018fd930338c099371104/tumblr_n2m73lTx2Q1svn82uo1_400.gif", product_id: product1.id)

# product2 = Product.create({
#   supplier_id: supplier1.id,
#   name: "Space Cowboy Laser Gun",
#   price: 170.0,
#   description: "This weapon has no other description than, Shiney!"
# })
# Image.create(url: "http://cdn.shopify.com/s/files/1/0289/1534/products/MalPistol_MP-1_1756x988_e53f9448-81ec-41de-9369-4cbad64f18f5_1024x1024.jpg?v=1401915776", product_id: product2.id)

# product3 = Product.create({
#   supplier_id: supplier2.id,
#   name: "DnD Dice set",
#   price: 57.50,
#   description: "Take down mighty dragons with this timeless set of 20 sided wonders"
# })
# Image.create(url: "https://s-media-cache-ak0.pinimg.com/736x/9c/15/7b/9c157bea5331463f9c539cbce739a4b8.jpg", product_id: product3.id)

# product4 = Product.create({
#   supplier_id: supplier1.id,
#   name: "Sonic Screwdriver",
#   price: 9.99,
#   description: "The Doctor's sciencey magic wand to get out of tight spots. Note: does not work on wood"
# })
# Image.create(url: "https://sketchfab.com/blogs/community/wp-content/uploads/2020/04/image2-2.jpg", product_id: product4.id)

# product5 = Product.create({
#   supplier_id: supplier2.id,
#   name: "Yoda sleeping bag",
#   price: 40.00,
#   description: "For real"
# })
# Image.create(url: "https://staticdelivery.nexusmods.com/mods/1151/images/12353-0-1461721930.png", product_id: product5.id)
# ------------------------------------------------------------------
# Populates:
#   • 1 admin + 10 regular users
#   • 3 suppliers
#   • 10 categories
#   • 50 products (each with 1-3 images and 1-3 categories)
#   • 100 orders (random users & products, qty 1-5)
#
# Requires faker. If it isn't in your Gemfile yet, add:
#   gem "faker", "~> 3.4"
# then: bundle install
# ------------------------------------------------------------------

require "faker"
require "bigdecimal/util"

TAX_RATE = 0.05 # 5 %

puts "\n🌱  Resetting tables…"
[ Image, CategoryProduct, Category, Order,
 Product, Supplier, User ].each(&:delete_all)

# ---------------------------- Users -------------------------------
puts "🔑  Creating users…"
admin = User.create!(
  name:  "Admin User",
  email: "admin@example.com",
  password:              "password",
  password_confirmation: "password",
  admin: true
)

10.times do
  User.create!(
    name:  Faker::Name.name,
    email: Faker::Internet.unique.email,  # works on any Faker version
    password:              "password",
    password_confirmation: "password"
  )
end

# -------------------------- Suppliers -----------------------------
puts "🏭  Creating suppliers…"
3.times do
  Supplier.create!(
    name:         Faker::Company.unique.name,
    email:        Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.phone_number
  )
end
suppliers = Supplier.all

# -------------------------- Categories ----------------------------
puts "🏷️   Creating categories…"
category_names = %w[
  Apparel Electronics Books Home Beauty Toys
  Sports Grocery Automotive Garden
]
categories = category_names.map { |n| Category.create!(name: n) }

# --------------------------- Products -----------------------------
puts "📦  Creating products, images & tags…"
50.times do
  product = Product.create!(
    name:        Faker::Commerce.unique.product_name,
    description: Faker::Lorem.sentence(word_count: 12),
    price:       Faker::Commerce.price(range: 5..200).round, # integer dollars
    supplier:    suppliers.sample
  )

  # 1-3 placeholder images
  rand(1..3).times do
    Image.create!(
      url: "https://picsum.photos/seed/#{SecureRandom.hex(4)}/400/400",
      product: product
    )
  end

  # tag with 1-3 categories
  categories.sample(rand(1..3)).each do |cat|
    CategoryProduct.create!(product: product, category: cat)
  end
end
products = Product.all

# ---------------------------- Orders ------------------------------
puts "🧾  Creating orders…"
users = User.where(admin: false)

100.times do
  product  = products.sample
  quantity = rand(1..5)
  subtotal = (product.price * quantity).to_d
  tax      = (subtotal * TAX_RATE).round(2)
  total    = subtotal + tax

  Order.create!(
    user:     users.sample,
    product:  product,
    quantity: quantity,
    subtotal: subtotal,
    tax:      tax,
    total:    total
  )
end

# --------------------------- Summary ------------------------------
puts "\n✅  Seeding complete!"
puts "   Users:      #{User.count} (#{User.where(admin: true).count} admin)"
puts "   Suppliers:  #{Supplier.count}"
puts "   Categories: #{Category.count}"
puts "   Products:   #{Product.count}"
puts "   Images:     #{Image.count}"
puts "   Orders:     #{Order.count}"

# If you ever need to reuse Faker's unique generators elsewhere:
#   Faker::UniqueGenerator.clear
