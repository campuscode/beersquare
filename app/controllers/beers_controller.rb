class BeersController < ApplicationController
  def search
    @beers = Beer.where(name: params[:q])
  end
end
