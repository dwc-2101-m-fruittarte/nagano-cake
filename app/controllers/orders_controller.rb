class OrdersController < ApplicationController

  def new
    @order = Order.new
    @tax = 1.1
    @total_price = 0
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @total_price += cart_item.product.price * cart_item.quantity
   end
    @shipping = @tax * @total_price
  end

  def index
  end

  def info
   @order = Order.new(order_params)
   @tax = 1.1
    @total_price = 0
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @total_price += cart_item.product.price * cart_item.quantity
   end
   session[:order] = order_params
  end

  def create
    @order = current_customer.orders.new(session[:order])
    if @order.save
      session.delete(:order)
      redirect_to thanks_orders_path
    else
      render :info
    end
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :bill, :shipping, :payment_method)
  end
  
  # def find_cart
  #   cart_item = Cart.find_by(id: session[:cart_id])
  # end

end
