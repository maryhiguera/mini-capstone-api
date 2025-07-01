class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find(params[:id])

    @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      password: params[:password] || @user.password,
      password_confirmation: params[:password_confirmation] || @user.password_confirmation,
      admin: params[:update] || @user.admin
    )

    if user.update
      render json: { message: "user updated" }
    else
      render json: { errors: user.error.full_messages }
    end
  end
end
