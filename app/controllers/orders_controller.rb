class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    product = Product.find_by(id: params[:product_id])

    subtotal = product.price * params[:quantity].to_i
    tax = product.tax * params[:quantity].to_i
    total = subtotal + tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total,
    )
    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      render :show
    else
      render json: { message: "Order does not exist for current user" }
    end
  end

  def index
    @orders = current_user.orders
    render :index
  end
end
