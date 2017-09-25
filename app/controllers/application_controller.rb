require_relative '../services/auth'

class ApplicationController < ActionController::API
  include Auth::Authenticator

  def current_user
    auth_token = /\ABearer (.+)\z/.match request.headers['HTTP_AUTHORIZATION']

    return nil if auth_token.nil?

    auth_token = auth_token[1]
    decoded = decode_payload auth_token

    return nil if decoded.nil?

    account = Account.new(id: decoded['user']['accountId'])
    User.new(id: decoded['user']['id'], username: decoded['user']['username'], account: account)
  end

  def respond(respond_body, status: :ok, serializer: nil)
    render json: respond_body, :status => status, :serializer => serializer
  end

  def respond_created(respond_body, serializer: nil)
    respond respond_body, :status => :created, :serializer => serializer
  end
end
