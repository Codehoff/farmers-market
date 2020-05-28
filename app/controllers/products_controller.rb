class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # def recent
  # @posts = Product.order("created_at desc").limit(3)
  # end

  def index
    # @products = Product.all
    @products = policy_scope(Product).order(created_at: :asc)
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    authorize @product

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
    redirect_to "/products", notice: 'Product was successfully updated.'
  end

  def destroy
    @product.destroy
    redirect_to "/products", notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_info, :category_id, :unit, :photo)
  end
end
