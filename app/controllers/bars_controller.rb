class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    @checkins = Checkin.where(bar: @bar)
  end
end
