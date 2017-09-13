class TeamTournamentsController < ApplicationController

  def create
    @team_tournament = TeamTournament.create!(permitted_params)

    respond_to do |format|
      format.html { redirect_to tournaments_path }
      format.js { render :replace_tournament_preview }
    end
  end

  def destroy
    @team_tournament = TeamTournament.find(params[:id])
    @team_tournament.destroy!

    respond_to do |format|
      format.html { redirect_to tournaments_path }
      format.js { render :replace_tournament_preview }
    end
  end

  def permitted_params
    params.permit(:team_id, :tournament_id)
  end

end
