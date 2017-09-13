require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2

      option :name, 'starladder'
      option :client_options, {
        :site => StarladderUrlModule::SITE_URL,
        :authorize_url => StarladderUrlModule::OAUTH_AUTHORIZE_URL,
        :token_url => StarladderUrlModule::OAUTH_TOKEN_URL
      }
      option :authorize_params, { grant_type: 'authorization_code' }

      uid { raw_info['id'].to_s }

      info do
        {
          id: raw_info['id'],
          nickname: raw_info['nick']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('https://auth.starladder.com/en/api/v1/me.json').parsed
      end

      def callback_url
        StarladderUrlModule::REDIRECT_URL
      end

    end
  end
end
