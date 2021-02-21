class Managers::OrdersController < ApplicationController

  before_action :authenticate_manager!

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
    session[:order_params] = order_params
    @order.bill = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + 800
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_product = @order.order_products
  end

  def calculate(products_total_price)
    @products_total_price = 0
    @order_products.each {|order_product|
    tax_in_price = (order_product.product_price * 1.1).floor
    sub_total_price = tax_in_price * order_product.quantity
    @products_total_price += sub_total_price
    }
    return @products_total_price
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :bill)
  end

  def order_product_params
    params.require(:order_product).permit(:quantity)
  end
end