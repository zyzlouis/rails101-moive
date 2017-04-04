class MymoivesController < ApplicationController
  def index
    @mymoives = Mymoive.all
  end

  def new
    @mymoive = Mymoive.new
  end


end
