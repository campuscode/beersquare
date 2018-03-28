class CheckinsController < ApplicationController
  def create
    checkin = Checkin.new(checkin_params)

    redirect_to bar_path(params[:bar_id]) if checkin.save
  end

  private

  def checkin_params
    params.permit(:bar_id, :beer_id)
  end
end
