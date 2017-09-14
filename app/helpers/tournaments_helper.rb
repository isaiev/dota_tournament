module TournamentsHelper

  def users_team_registered?(tournament)
    @current_user.team.tournaments.include?(tournament)
  end

  def users_team_not_registered?(tournament)
    !users_team_registered?(tournament)
  end

end
