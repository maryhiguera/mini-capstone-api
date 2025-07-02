class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
      @carted_products = current_user.carted_products.where(status: "carted")
      render json: @carted_products
  end

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )

    render json: @carted_product
  end

  def destroy
    @carted_product = current_user.carted_products.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    render json: { message: "Product was removed from the cart" }
  end
end
