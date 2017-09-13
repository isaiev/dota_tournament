class User < ApplicationRecord

  def self.find_or_create_with_omniauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider']) || create!(provider: auth[:provider],
                                                                     uid: auth[:uid],
                                                                     nickname: auth[:info][:nickname])
  end

end
