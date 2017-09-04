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
  end
end
