class ProductsController < ApplicationController
  def show
    product = Product.find(params[:id])

    render json: product
  end

  def all_products
    products = Product.all

    render json: products
  end
end
