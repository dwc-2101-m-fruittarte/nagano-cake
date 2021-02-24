class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.bill = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + 800
    # @carts = current_customer.carts
    @order = Order.new(order_params)
    @payment_method = params[:order][:payment_method]
    @delivery_addr = params[:order][:address]
    case @delivery_addr
    when "my_addr" then
      @postcode = current_customer.postcode
      @address = current_customer.address
      @name = current_customer.last_name + " " + current_customer.first_name
    when "registered_addr" then
      delivery = Delivery.find(params[:order][:registered_address])
      @post_code = delivery.postcode
      @address = delivery.address
      @name = delivery.name
    when "new_addr" then
      @post_code = params[:order][:new_post_cd]
      @address = params[:order][:new_address]
      @name = params[:order][:new_name]
    end
  end

  def index
     @orders = current_customer.orders
  end

  def info
   @order = current_customer.orders.new(order_params)
   session[:order_params] = order_params
   session[:address] = order_params
   @cart_items = current_customer.cart_items
   @postcode = current_customer.postcode
      @address = current_customer.address
      @name = current_customer.family_name + " " + current_customer.first_name
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
    # session[:product_id] = params[:product_id]
    # session[:quantity] = params[:quantity]
    # session[:tax_in_price] = params[:tax_in_price]
    # session[:order_id] = params[:order_id]
    @order_products.save
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
    params.require(:order).permit(:payment_method, :bill, :address, :postcode, :name, :customer_id)
  end

end
