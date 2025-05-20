class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    render :show
  end

  def index
    @products = Product.all
    render :index
  end
   
  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
    )
    render :show 
  end

  def update
    @product = Product.find(params[:id])
     
    @product = Product.update(
      name: params["name"] || product.name,
      price: params["price"] || product.price,
      image_url: params["image_url"] || product.image_url,
      description: params["description"] || product.description
    )
    render :show
  end

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy 
    render json: { message: "product destroyed" }
  end

end
