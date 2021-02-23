class ProductsController < ApplicationController
  
  def new
  end

<<<<<<< HEAD
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

   private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :image_id, :is_active,)
  end

end
=======
  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end
  
end
>>>>>>> develop2
