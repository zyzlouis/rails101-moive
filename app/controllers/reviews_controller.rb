class ReviewsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create,:edit,:update,:destroy]
  before_action :check_is_favorite_of_moive, only: [:new,:edit,:destroy]

  def new

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


  def edit

    @review = Review.find(params[:id])
  end

  def update
    @mymoive = Mymoive.find(params[:mymoife_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to account_reviews_path, notice: "Update Review Success"
    else
      :edit
    end
  end

  def destroy

    @review = Review.find(params[:id])
    @review.destroy
    redirect_to account_reviews_path, alert: "Deleted Review Success"
  end

  private

  def check_is_favorite_of_moive
    @mymoive = Mymoive.find(params[:mymoife_id])
    if !current_user.is_favorite_of?(@mymoive)
      redirect_to root_path, alert: "必须收藏影片才可以进行评价."
    end
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
