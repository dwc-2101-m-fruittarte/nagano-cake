class Managers::ProductsController < ApplicationController

  before_action :authenticate_manager!
  # before_action :ensure_current_user, only[:edit, :update]
  # before_action :set_product, only[:new, :create, :edit, :update]

  def index
    @products = Product.all
    @product = Product.new
    @products = Product.search(params[:search])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to managers_product_path(@product)
      # redirect_to products_path
    else
      # redirect_to new_manager_product_path
      render :new
    end
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
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :image, :is_active)

  end

  def ensure_current_user
    product = Product.find(params[:id])
    if product.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end