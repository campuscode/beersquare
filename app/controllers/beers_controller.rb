class BeersController < ApplicationController
  def search
    @search = params[:q]
    @beers = Beer.where('name LIKE ?', "%#{@search}%")
  end

  def show
    @beer = Beer.friendly.find(params[:id])
    @checkins = Checkin.where(beer_id: @beer.id).order(created_at: :desc)
  end
end
