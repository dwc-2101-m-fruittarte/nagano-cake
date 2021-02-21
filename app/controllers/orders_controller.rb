class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    session[:customer_id] = params[:customer_id]
    session[:payment_method] = params[:payment_method]

    if
      session[:customer_id].present?
      session[:payment_method].present?
      redirect_to info_orders_path
    else
      redirect_to new_order_path
    end
    # @order =Order.new(order_params)
    # @cart_items = current_customer.cart_items
    # @tax = 1.1
    # @total_price = 0
    # @cart_items.each do |cart_item|
    # @total_price += cart_item.product.price * cart_item.quantity
    # if @order.save
    #   redirect_to thanks_orders_path
    # else
    #   render :info
    # end
    # end
  end

  def info
    @orders = current_customer.orders
    # @total_price = calculate(current_customer)

    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @tax = 1.1
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    end
  end

  # 注文の保存？
  def create_order
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = session[:payment_method]
    # @order.total_price = calculate(current_customer)
    @cart_items = current_customer.cart_items
    @tax = 1.1
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    @order.save
    end
    # 注文商品の保存？
    current_customer.cart_items.each do |cart|
      @order_products = OrderProduct.new
      @order_products.order_id = @order.id
      @order_products.name = cart.product.name
      @order_products.price = cart.product.price
      @order_products.quantity = cart.quantity
      @order_products.save
    end
    current_customer.cart_items.destroy_all
    session.delete(:payment_method)
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
    params.require(:order).permit(:customer_id, :payment_method)
  end

end