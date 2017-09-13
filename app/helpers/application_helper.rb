module ApplicationHelper

  def team_tournament(team_id, tournament_id)
    TeamTournament.find_by(team_id: team_id, tournament_id: tournament_id)
  end

end
