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
      @order.user = current_user

      if @order.save
          redirect_to product_path(@product)
      else
          render :new
      end
      raise
    end

    def destroy
    end

    private

    def order_params
      params.require(:order).permit(:quantity)
    end
end

