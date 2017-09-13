class TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
    @teams = @tournament.teams
  end

end
