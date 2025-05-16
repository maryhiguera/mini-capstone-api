class ProductsController < ApplicationController
  def first_product
    product = Product.first

    render json: product
  end

  def all_products
    products = Product.all

    render json: products
  end

  def second_product
    product2 = Product.find(2)

    render json: product2
  end
end
