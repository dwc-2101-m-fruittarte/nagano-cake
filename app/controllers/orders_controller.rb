class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def info
    @orders = current_customer.orders
    
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
  end

