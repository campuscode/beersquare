class BarController < ApplicationController

  def show
    @bar = Bar.find(params[:id])
  end
end
