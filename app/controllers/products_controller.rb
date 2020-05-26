class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    if @product.save
      redirect_to "/products", notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    @product.update(product_params)
    redirect_to "/products"
  end

  def destroy
    @product.destroy
    redirect_to "/products"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_info, :category, :unit, :photo)
  end
end
