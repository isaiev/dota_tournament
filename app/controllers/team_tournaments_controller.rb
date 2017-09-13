class TeamTournamentsController < ApplicationController

  def create
    TeamTournament.create!(permitted_params)
  end

  def destroy
    TeamTournament.find(params[:id]).destroy!
  end

  def permitted_params
    params.permit(:team_id, :tournament_id)
  end

end
