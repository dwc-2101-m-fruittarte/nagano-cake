class CartItemsController < ApplicationController

  def index
   @cart_items = current_customer.cart_items
  end

  def create
   @product = Product.find(params[:product_id])
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   @cart_item.product_id = @product.id
   @cart_item.save
   redirect_to cart_items_path
  end


  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy_all
  end

  private
  def cart_item_params
     params.require(:cart_item).permit(:customer_id, :product_id, :quantity)
  end

end
