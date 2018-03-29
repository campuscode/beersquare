class CheckinsController < ApplicationController
  before_action :authenticate_user!
  def create
    checkin = Checkin.new(
      bar_id: params[:bar_id], beer_id: params[:beer_id], user: current_user
    )

    if checkin.save
      redirect_to edit_bar_checkin_path(
        bar_id: params[:bar_id], id: checkin.id
      )
    else
      flash[:error] = 'Houve algum problema'
    end
  end

  def edit
    @checkin = Checkin.find(params[:id])
    @full_description = @checkin.full_description
  end

  def update
    @checkin = Checkin.find(params[:id])
    @checkin.update(description: params[:description])

    redirect_to bar_path(@checkin.bar_id)
  end
end
