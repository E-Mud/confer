require 'jwt'

module Auth
  module Authenticator
    def generate_token(user)
      payload = {}
      payload[:user] = {
        id: user.id,
        username: user.username,
        accountId: user.account_id
      }

      JWT.encode payload, Confer::Application.secrets[:secret_key_base], 'HS256'
    end

    def decode_payload(token)
      return nil if token.nil?
      
      payload, _ = JWT.decode token, Confer::Application.secrets[:secret_key_base], true, { :algorithm => 'HS256' }

      payload
    end
  end
end
