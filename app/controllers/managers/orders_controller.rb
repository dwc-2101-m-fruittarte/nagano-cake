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
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_product = @order.order_products
  end
  
  #りんさん編集----
  def order_status_update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save
    redirect_to managers_order_path(@order)
  end

  def make_status_update
    order_product = OrderProduct.find(params[:id])
    order_product.update(make_status_params)
    order_product.save
    redirect_to managers_order_path(order_product.order_id)
  end
 #------- ここまで
  
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
    params.require(:order).permit(:status)
  end

  def order_product_params
    params.require(:order_product).permit(:quantity)
  end

  def make_status_params
    params.require(:order_product).permit(:make_status)
  end
end