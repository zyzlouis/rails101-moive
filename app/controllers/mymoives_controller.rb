class MymoivesController < ApplicationController
  def index
    @mymoives = Mymoive.all
  end

  def new
    @mymoive = Mymoive.new
  end

  def create
    @mymoive = Mymoive.new(mymoive_params)
    @mymoive.save
    redirect_to mymoives_path
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
  end

  private

  def mymoive_params
    params.require(:mymoive).permit(:name,:description)
  end

end
