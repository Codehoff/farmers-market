class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
   @product = Product.find(params[:product_id])
   @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @order.product = @product
    if @order.save
      redirect_to product_path(@product)
    else
      @review = Review.new
      render "products/show"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to product_path(@order.product)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:quantity, :price_per_unit, :total_price, :user_id, :product_id)
  end
end

