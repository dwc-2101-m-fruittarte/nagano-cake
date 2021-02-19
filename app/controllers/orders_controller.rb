class OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def info
    @order = Order.new
    @cart_items = current_customer.cart_items
    @order.payment_method = (params[:order][:payment_method]).to_i
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to thanks_orders_path
    else
      render :info
    end
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
    
    def order_params
      params.require(:order).permit(:payment_method)
    end

end