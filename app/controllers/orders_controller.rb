class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, only: [ :create ]

  def index
    # figure out how to have it so a user only seeds their orders
    @orders = current_user.orders
    render json: @orders
  end

  def create
    carted_products = current.user.carted_products.where(status: "carted")
    calculated_subtotal = 0

    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.08
    calculated_total = calculated_tax + calculated_subtotal

    @order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    carted_products.update_all(status: "purchased", order_id: @order.id)
    render json: @order
    # product = Product.find(params[:product_id])

    # subtotal = product.price * params[:quantity].to_i
    # tax = subtotal * 0.08
    # total = subtotal + tax

    # @order = Order.new(
    #   quantity: params[:quantity],
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: total,
    #   user_id: current_user.id,
    #   product_id: params[:product_id],
    # )

    # if @order.save
    #   render json: @order, status: :created
    # else
    #   render json: { errors: @order.errors.full_messages }, status: :bad_request
    # end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    if @order
      render json: @order
    else
      render json: "Not your order..."
    end
  end
end
