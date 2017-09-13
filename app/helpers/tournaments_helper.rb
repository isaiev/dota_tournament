module TournamentsHelper

  def is_users_team_registered(tournament)
    @current_user.team.tournaments.include?(tournament)
  end

  def is_users_team_not_registered(tournament)
    !is_users_team_registered(tournament)
  end

  def team_tournament(id)
    @current_user.team.team_tournaments.find_by(team_id: @current_user.team.id, tournament_id: id)
  end

end
