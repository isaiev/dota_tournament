module TournamentsHelper

  def is_users_team_registered(tournament)
    @current_user.team.tournaments.include?(tournament)
  end

  def is_users_team_not_registered(tournament)
    !is_users_team_registered(tournament)
  end

end
