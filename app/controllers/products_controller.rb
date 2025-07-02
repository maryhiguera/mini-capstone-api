class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [ :index, :show ]

  def show
    @product = Product.find(params[:id])

    render :show
  end

  def index
    @product = Product.all

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end

    render :index
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
    )

    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def update
    @product = Product.find(params[:id])

    @product.update(
      name: params["name"] || product.name,
      price: params["price"].to_i || product.price,
      image_url: params["image_url"] || product.image_url,
      description: params["description"] || product.description
    )

    if @product.valid?
      render :show
    else
      render json: { errors: @product.errors.full_messages }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: { message: "product destroyed" }
  end
end
