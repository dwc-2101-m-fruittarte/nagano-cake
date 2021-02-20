class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def info
   @order = current_customer.orders.new(order_params)
   session[:order_params] = order_params
   @cart_items = current_customer.cart_items
   @tax = 1.1
   @total_price = 0
   @cart_items.each do |cart_item|
     @total_price += cart_item.product.price * cart_item.quantity
   end
  end

  def create
    @order = current_customer.orders.build(session[:order_params])
    @order.save
    current_customer.cart_items.each do |cart_item|
    @order_products = OrderProduct.new(
          product_id: cart_item.product.id,
          quantity: cart_item.quantity,
          tax_in_price: cart_item.product.price * 1.1,
          order_id: @order.id)
    session[:product_id] = params[:product_id]
    session[:quantity] = params[:quantity]
    session[:tax_in_price] = params[:tax_in_price]
    session[:order_id] = params[:order_id]
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def thanks
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
