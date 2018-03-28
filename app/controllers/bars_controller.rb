class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    @checkins = Checkin.where(bar: @bar).order('created_at DESC')
  end

  def index
    @bars = Bar.all
  end
end
