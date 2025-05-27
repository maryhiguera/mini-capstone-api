# Create suppliers
supplier1 = Supplier.create(name: "Amazon", email: "amazon@email.com", phone_number: "243222342")
supplier2 = Supplier.create(name: "Think Geek", email: "thinkgeek@email.com", phone_number: "5432534")

# Create products and their associated images
product1 = Product.create({
  supplier_id: supplier2.id,
  name: "Lightsaber",
  price: 270.10,
  description: "Part laser, part samurai sword, all awesome. The lightsaber is an elegant weapon for a more civilized age, not nearly as clumsy as a blaster"
})
Image.create(url: "http://25.media.tumblr.com/d2456964024018fd930338c099371104/tumblr_n2m73lTx2Q1svn82uo1_400.gif", product_id: product1.id)

product2 = Product.create({
  supplier_id: supplier1.id,
  name: "Space Cowboy Laser Gun",
  price: 170.0,
  description: "This weapon has no other description than, Shiney!"
})
Image.create(url: "http://cdn.shopify.com/s/files/1/0289/1534/products/MalPistol_MP-1_1756x988_e53f9448-81ec-41de-9369-4cbad64f18f5_1024x1024.jpg?v=1401915776", product_id: product2.id)

product3 = Product.create({
  supplier_id: supplier2.id,
  name: "DnD Dice set",
  price: 57.50,
  description: "Take down mighty dragons with this timeless set of 20 sided wonders"
})
Image.create(url: "https://s-media-cache-ak0.pinimg.com/736x/9c/15/7b/9c157bea5331463f9c539cbce739a4b8.jpg", product_id: product3.id)

product4 = Product.create({
  supplier_id: supplier1.id,
  name: "Sonic Screwdriver",
  price: 9.99,
  description: "The Doctor's sciencey magic wand to get out of tight spots. Note: does not work on wood"
})
Image.create(url: "https://sketchfab.com/blogs/community/wp-content/uploads/2020/04/image2-2.jpg", product_id: product4.id)

product5 = Product.create({
  supplier_id: supplier2.id,
  name: "Yoda sleeping bag",
  price: 40.00,
  description: "For real"
})
Image.create(url: "https://staticdelivery.nexusmods.com/mods/1151/images/12353-0-1461721930.png", product_id: product5.id)
