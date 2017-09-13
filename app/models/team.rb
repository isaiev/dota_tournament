class Team < ApplicationRecord

  mount_uploader :logo, ::LogoUploader

  belongs_to :owner, foreign_key: :user_id, class_name: 'User'

end
