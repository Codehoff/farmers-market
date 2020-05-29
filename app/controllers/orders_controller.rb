class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]


  def index
    # @orders = Order.all
    @orders = policy_scope(Order).order(created_at: :asc)
  end

  def show
  end

  def new
      @product = Product.find(params[:product_id])
      @order = Order.new
      authorize @order
  end

  def create
      @product = Product.find(params[:product_id])
      @order = Order.new(order_params)
      authorize @order
      @order.product = @product
      @order.user = current_user

      buyers = @product.buyers
      unless buyers.include? @order.user.id.to_i
        @product.buyers << @order.user.id.to_i
      end

      if @order.save
         @product.stock_info -= @order.quantity
         @product.save
          redirect_to "/orders"
      else
          render :new
      end
    end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to "/orders", notice: 'Your order was successfully updated.'
  end

  def destroy
    authorize @order
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def order_params
    params.require(:order).permit(:quantity)
  end
end

