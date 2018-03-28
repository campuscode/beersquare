class SchoolBeersController < ApplicationController
  def search
    @school_beer = SchoolBeer.find(params[:q])
  end
end
