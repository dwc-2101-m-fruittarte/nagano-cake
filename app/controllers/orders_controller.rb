class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def info
    @orders = current_customer.orders
    @order = Order.new
    @cart_items = current_customer.cart_items
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.order.new(order_params)
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
     params.require(:orders).permit(:customer_id, :name, :bill, :shipping, :payment_method ).merge(product_id: current_customer.id)
   end

end