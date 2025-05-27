class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find(params[:id])
    render :show
  end

  def create
    @supplier = Supplier.create!(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"]
    )

    if @supplier.valid?
      render :show
    else
      render json: { errors: @supplier.errors.full_message }
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    @supplier.update(
      name: params["name"] || @supplier.name,
      email: params["email"] || @supplier.email,
      phone_number: params["phone_number"] || @supplier.phone_number
    )

    if @supplier.valid?
      render :show
    else
      render json: { errors: @supplier.errors.full_message }
    end
  end

  def destroy
     @supplier = Supplier.find(params[:id])
     @supplier.destroy
     render json: { message: "supplier destroyed" }
  end
end
