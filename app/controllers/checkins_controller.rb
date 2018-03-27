class CheckinsController < ApplicationController
  def create
    checkin = Checkin.new(checkin_params)

    if checkin.save
      redirect_to bar_path(params[:bar_id])
    end
  end

  private
  def checkin_params
    params.permit(:bar_id, :beer_id)
  end
end
