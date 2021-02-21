class Managers::OrdersController < ApplicationController

  # before_action :authenticate_manager!

  def index
    if params[:id] # 会員詳細から来た場合
      @orders = Customer.find(params[:id]).orders
    elsif request.fullpath.include? "today" # TOP本日受注分から来た場合
      @orders = Order.where(created_at:  Time.zone.now.all_day)

    elsif request.fullpath.include? "yesterday" # TOP本日製作分から来た場合
      @orders = Order.where(created_at: 1.day.ago.all_day)
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products.all
    @products_total_price = calculate(@order)
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

  def order_product_params
    params.require(:order_product).permit(:quantity)
  end

end
