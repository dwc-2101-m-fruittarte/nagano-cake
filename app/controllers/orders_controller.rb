class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def info
   @order = Order.new
   @cart_items = current_customer.cart_items
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    if @order.save
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
    params.require(:order).permit(:customer_id, :name, :postcode, :address, :bill, :shipping, :payment_method, :status)
  end

end
