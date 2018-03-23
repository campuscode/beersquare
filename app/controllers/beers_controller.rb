class BeersController < ApplicationController
  def search
    @search = params[:q]
    @beers = Beer.where('name LIKE ?', "%#{@search}%")
  end
end
