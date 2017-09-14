# == Schema Information
#
# Table name: team_tournaments
#
#  id            :integer          not null, primary key
#  team_id       :integer          indexed, indexed => [tournament_id]
#  tournament_id :integer          indexed => [team_id], indexed
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_team_tournaments_on_team_id                    (team_id)
#  index_team_tournaments_on_team_id_and_tournament_id  (team_id,tournament_id) UNIQUE
#  index_team_tournaments_on_tournament_id              (tournament_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#  fk_rails_...  (tournament_id => tournaments.id)
#

class TeamTournament < ApplicationRecord

  belongs_to :team
  belongs_to :tournament

  validates :team_id, :tournament_id, presence: true
  validates :team_id, uniqueness: { scope: [:team_id, :tournament_id] }
  validates :tournament_id, uniqueness: { scope: [:team_id, :tournament_id] }

end
