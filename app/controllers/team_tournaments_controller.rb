class TeamTournamentsController < ApplicationController

  before_action :check_team_owner, only: [:create]
  before_action :check_team_tournament, only: [:destroy]

  def create
    @team_tournament = TeamTournament.new(permitted_params)

    if @team_tournament.save
      respond_to do |format|
        format.html { redirect_to tournaments_path }
        format.js { render :replace_tournament_preview }
      end
    else
      respond_to do |format|
        format.html { redirect_to tournaments_path }
        format.js
      end
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

  private

  def permitted_params
    params.permit(:team_id, :tournament_id)
  end

  def check_team_owner
    @team = Team.find(permitted_params[:team_id])

    forbidden unless @team.user_id == @current_user.id
  end

  def check_team_tournament
    @team_tournament = TeamTournament.find(params[:id])

    forbidden if !@team_tournament || (@team_tournament.team.owner != @current_user)
  end

end
