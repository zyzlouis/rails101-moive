class MymoivesController < ApplicationController
  def index
    @mymoives = Mymoive.all
  end
end
