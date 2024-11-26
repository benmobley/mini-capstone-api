class OrdersController < ApplicationController
  def create
    subtotal = Product.find_by(id: params[:product_id]).price
    tax = subtotal * 0.08
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
    if current_user
      if current_user.id == @order.user_id
        render :show
      else
        render json: { message: "Order does not exist for current user" }
      end
    else
      render json: { message: "Must be logged in" }
    end
  end

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
      render :index
    else
      render json: { message: "Must be logged in" }
    end
  end
end
