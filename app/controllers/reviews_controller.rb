class ReviewsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @mymoive = Mymoive.find(params[:mymoife_id])
    @review = Review.new
  end

  def create
    @mymoive = Mymoive.find(params[:mymoife_id])
    @review = Review.new(review_params)
    @review.mymoive = @mymoive
    @review.user = current_user

    if @review.save
      redirect_to mymoife_path(@mymoive)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
