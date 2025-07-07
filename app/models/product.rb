class Product < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # validates :description, length: { minimum: 5 }
  # validates :price, numericality: { greater_than: 50 }

  belongs_to :supplier
  has_many :images, dependent: :destroy
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :orders, through: :carted_products
  has_many :carted_products

  def full_product
    "#{price} : #{description}"
  end

  def friendly_created_at
  created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def primary_image_url
    if images.length > 0
      images[0].url
    else
      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
    end
  end


  # def categories
  #   category_products.map do |category_product|
  #     category_product.category
  #   end
  # end


  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
end
