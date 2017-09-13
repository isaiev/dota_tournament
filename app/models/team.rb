class Team < ApplicationRecord

  mount_uploader :logo, ::LogoUploader

  belongs_to :owner, foreign_key: :user_id, class_name: 'User'

  has_many :team_tournaments
  has_many :tournaments, through: :team_tournaments

end
