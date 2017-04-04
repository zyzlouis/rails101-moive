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

  private

  def mymoive_params
    params.require(:mymoive).permit(:name,:description)
  end

end
