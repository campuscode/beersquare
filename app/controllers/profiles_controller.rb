class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit]

  def show
    @profile = Profile.find_by(user_id: params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    return unless @profile.update(profile_params)
    flash[:notice] = 'Perfil atualizado com sucesso'

    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:birth_date, :name)
  end
end
