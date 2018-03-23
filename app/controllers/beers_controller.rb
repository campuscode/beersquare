class BeersController < ApplicationController
  def search
    @search = params[:q]
    @beers = Beer.where('name LIKE ?', "%#{@search}%")
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
