class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, presence: true

  has_many :products

  # def products
  #   Product.where(supplier_id: id)
  # end
end
