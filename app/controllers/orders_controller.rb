class OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def info
   @order = Order.new(order_params)
   @cart_items = current_customer.cart_items
   @tax = 1.1
   @total_price = 0
   @cart_items.each do |cart_item|
     @total_price += cart_item.product.price * cart_item.quantity
   end
  end

  def create
    @order =Order.new(order_params)
    if @order.save
      redirect_to thanks_orders_path
    else
      render :info
    end
  end

  def thanks
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  private

  def order_params
    params.require(:order)
    .permit(:payment_method)
  end

end