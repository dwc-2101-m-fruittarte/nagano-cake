class Managers::OrdersController < ApplicationController
  def index
    if params[:id] # 会員詳細から
      @orders = Customer.find(params[:id]).orders
    elsif request.fullpath.include? "today" # 本日受注分から
      @orders = Order.where(created_at:  Time.zone.now.all_day)

    elsif request.fullpath.include? "yesterday" # 本日製作分から
      @orders = Order.where(created_at: 1.day.ago.all_day)
    else
      @orders = Order.all
    end
  end
  
  def show
    # @product = Product.find(params[:id])
    # @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_product = @order.order_products
  #   @cart_items = current_customer.cart_items
  # @tax = 1.1
  # @total_price = 0
  # @cart_items.each do |cart_item|
  #   @total_price += cart_item.product.price * cart_item.quantity
  # end
  end
end