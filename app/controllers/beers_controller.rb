class BeersController < ApplicationController
  def search
    @beers = Beer.where(name: params[:q])
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
