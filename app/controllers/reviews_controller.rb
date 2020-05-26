class ReviewsController < ApplicationController
  before_action :find_order
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.order = Order.find(params[:order_id])
    @review.order = @order
    if @review.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_order
    @order = Restaurant.find(params[:order_id])
  end
end

