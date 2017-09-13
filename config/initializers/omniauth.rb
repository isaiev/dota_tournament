module OmniAuth
  module Strategies
    autoload :Starladder, Rails.root.join('lib', 'omniauth', 'strategies', 'starladder')
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starladder, ENV['STARLADDER_APP_ID'], ENV['STARLADDER_SECRET'], { :provider_ignores_state => true }
end