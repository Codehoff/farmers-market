class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]

  
  def index
    @reviews = review.all
  end

  def show
  end

  def new
      @product = Product.find(params[:product_id])
      @review = Review.new
  end

  def create
      @product = Product.find(params[:product_id])
      @review = Review.new(review_params)
      @review.product = @product     
      if @review.save
          redirect_to product_path(@product)
      else
          render :new
      end
      raise
    end
  
    private
  
    def review_params
      params.require(:review).permit(:content)
    end
end

