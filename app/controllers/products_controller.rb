class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to managers_product_path(@product)
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to managers_product_path(@product)
    else
      render :edit
    end
  end

   private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :image_id, :is_active)
  end

end