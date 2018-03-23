class BeersController < ApplicationController
  def search
    @search = params[:q]
    @beers = Beer.where("name LIKE ?", "%#{@search}%")
    if @beers.empty?
      flash[:notice] = "Cerveja não encontrada"
    end
  end
end
