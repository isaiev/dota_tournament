# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  provider   :string
#  uid        :string
#

class User < ApplicationRecord

  has_one :team

  def self.find_or_create_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider']) || create!(provider: auth[:provider],
                                                                     uid: auth[:uid],
                                                                     nickname: auth[:info][:nickname])
  end

end
