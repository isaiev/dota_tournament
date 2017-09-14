# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  logo       :string
#  title      :string           indexed
#  user_id    :integer          indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teams_on_title    (title) UNIQUE
#  index_teams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Team < ApplicationRecord

  mount_uploader :logo, ::LogoUploader

  belongs_to :owner, foreign_key: :user_id, class_name: 'User'

  has_many :team_tournaments, dependent: :destroy
  has_many :tournaments, through: :team_tournaments, dependent: :destroy

  validates :title, uniqueness: true
  validates :title, :logo, presence: true

  def find_team_tournament(tournament_id)
    team_tournaments.find_by(tournament_id: tournament_id)
  end

end
