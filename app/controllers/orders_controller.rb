class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    total = 0
    subtotal = 0
    tax = 0
    carted_products.each do |carted_product|
      product = Product.find_by(id: carted_product.product_id)
      subtotal += product.price * carted_product.quantity
      tax += product.tax * carted_product.quantity
    end

    total = subtotal + tax

    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
    )

    carted_products.each do |carted_product|
      carted_product.update(status: "purchased", order_id: @order.id)
    end

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
