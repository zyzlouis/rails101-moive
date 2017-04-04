class MymoivesController < ApplicationController
   before_action :authenticate_user! , only: [:new,:create,:edit,:update,:destroy,:like,:cancle]
   before_action :find_mymoive_and_check_permission, only: [:edit,:update,:destroy]

  def index
    @mymoives = Mymoive.all
  end

  def new
    @mymoive = Mymoive.new
  end

  def create
    @mymoive = Mymoive.new(mymoive_params)
    @mymoive.user = current_user
    if @mymoive.save
      current_user.like!(@mymoive)
      redirect_to mymoives_path
    else
      render :new
    end
  end

  def show
    @mymoive = Mymoive.find(params[:id])
    @reviews = @mymoive.reviews.recent.paginate(:page => params[:page], :per_page => 3)
  end

  def edit

  end

  def update

    if @mymoive.update(mymoive_params)
      redirect_to mymoives_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy

    @mymoive.destroy
    redirect_to mymoives_path, alert: "Delete moive Success"
  end

  def like
   @mymoive = Mymoive.find(params[:id])

    if !current_user.is_favorite_of?(@mymoive)
      current_user.like!(@mymoive)
      flash[:notice] = "收藏影片成功！"
    else
      flash[:warning] = "该影片已收藏过"
    end

    redirect_to mymoife_path(@mymoive)
  end

  def cancle
    @mymoive = Mymoive.find(params[:id])

    if current_user.is_favorite_of?(@mymoive)
      current_user.cancle!(@mymoive)
      flash[:alert] = "已取消收藏！"
    else
      flash[:warning] = "从未收藏过，怎么取消？"
    end

    redirect_to mymoife_path(@mymoive)
  end

  private

  def find_mymoive_and_check_permission
    @mymoive = Mymoive.find(params[:id])
    if current_user != @mymoive.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def mymoive_params
    params.require(:mymoive).permit(:name,:description)
  end

end
