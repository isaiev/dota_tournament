module ApplicationHelper

  ACTIVE_CLASS = 'active'.freeze

  def navigation_class(path)
    current_page?(path) ? ACTIVE_CLASS : ''
  end

  def team_tournament(team_id, tournament_id)
    return unless team_id && tournament_id

    TeamTournament.find_by(team_id: team_id, tournament_id: tournament_id)
  end

end
