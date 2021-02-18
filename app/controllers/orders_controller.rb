class OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id:current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order = Order.new
  end

  def create
  end

  private

   def order_params
     params.require(:order).permit(:customer_id, :name, :bill, :payment_method )
   end

end