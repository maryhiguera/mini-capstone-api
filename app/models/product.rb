class Product < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # validates :description, length: { minimum: 5 }
  # validates :price, numericality: { greater_than: 50 }

  belongs_to :supplier
  has_many :images

  def full_product
    "#{price} : #{description}"
  end

  def friendly_created_at
  created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
end
