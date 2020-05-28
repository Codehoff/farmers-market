class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]


  def index
    # @reviews = review.all
    @reviews = policy_scope(Product).reviews(created_at: :asc)

  end

  def show
    authorize @product
  end

  def new
      @product = Product.find(params[:product_id])
      @review = Review.new
      authorize @review

  end

  def create
      @product = Product.find(params[:product_id])
      @review = Review.new(review_params)
      @review.product = @product

      authorize @review

      @review.user_id = current_user.id  

      if @review.save
          redirect_to product_path(@product)
      else
          render :new
      end

    end

    private

    def review_params
      params.require(:review).permit(:content)
    end
end

