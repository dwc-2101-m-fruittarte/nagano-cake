class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_items = CartItem.new
  end
  
   private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :image_id, :is_active,)
  end
  
end