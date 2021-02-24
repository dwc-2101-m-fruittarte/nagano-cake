class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.bill = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + 800
    @deliveries = current_customer.deliveries
  end

  def index
    @orders = current_customer.orders
  end

  def info
   @order = current_customer.orders.new(order_params)
   # rin0222
   @cart_items = current_customer.cart_items
   @address = Delivery.find_by(address: params[:address])

    if params[:select] == "my_address"
      @address = Delivery.find_by(params[:address])
      # session[:address] ="〒" +current_customer.postcode+current_customer.address+current_customer.family_name+current_customer.first_name
      @order.name = current_customer.family_name + current_customer.first_name
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
    elsif params[:select] == "select_address"
          # @address = Delivery.find(session[:address])
          # session[:address] = delivery_params[:deliveries_id]
          @delivery = Delivery.find_by(id: delivery_params[:deliveries_id])
          @order.name = @delivery.name
          @order.postcode = @delivery.postcode
          @order.address = @delivery.address
          # @delivery.name = @address.name
          # @delivery.postcode = @address.postcode
          # @delivery.address = @address.address
    elsif params[:select] == "new_address"
    end
    if session[:address].present? && session[:payment_method].present?
      redirect_to orders_info_path
    end
  #------ここまで
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
  #りんさん編集
  def order_params
    params.require(:order).permit(:customer_id, :name, :postcode, :address, :shipping, :payment_method, :bill, :status)
  end
　
  def delivery_params
    #params.require(:order).permit(:deliveries_id)
    params.require(:order).permit(:payment_method, :bill, :address)
  end

end