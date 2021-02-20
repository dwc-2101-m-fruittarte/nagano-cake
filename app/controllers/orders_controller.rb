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
    @order =Order.new(session[:order])
    session[:order] = nil
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_product = @order.order_product.new
        order_product.product_id = cart_item.product.id
        order_product.quantity = cart_item.quantity
        order_product.save

      end
    end
    redirect_to thanks_orders_path
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
    params.require(:order).permit(:payment_method)
  end

end