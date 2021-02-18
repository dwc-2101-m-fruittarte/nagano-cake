class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def index
  end
  
  def info
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = @product.order.new(order_params)
    @order.save
    redirect_to thanks_customer_orders_path
  end
  
  def thanks
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:amount, :quantity, :item_id)
  end
  
end
