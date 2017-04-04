class MymoivesController < ApplicationController
   before_action :authenticate_user! , only: [:new,:create,:edit,:update,:destroy]

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
      redirect_to mymoives_path
    else
      render :new
    end
  end

  def show
    @mymoive = Mymoive.find(params[:id])
  end

  def edit
    @mymoive = Mymoive.find(params[:id])
  end

  def update
    @mymoive = Mymoive.find(params[:id])
    if @mymoive.update(mymoive_params)
      redirect_to mymoives_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @mymoive = Mymoive.find(params[:id])
    @mymoive.destroy
    redirect_to mymoives_path, alert: "Delete moive Success"
  end

  private

  def mymoive_params
    params.require(:mymoive).permit(:name,:description)
  end

end
