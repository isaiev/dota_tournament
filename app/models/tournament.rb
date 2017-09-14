# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tournament < ApplicationRecord

  has_many :team_tournaments
  has_many :teams, through: :team_tournaments

  validates :title, presence: true

end
