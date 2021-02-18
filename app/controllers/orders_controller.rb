class OrdersController < ApplicationController

  def index
    # @orders = Order.where(customer_id: current_customer.id)
    
    # 本来はログインしている会員のorderだけを取得する
    # ので後々以下は削除
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
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