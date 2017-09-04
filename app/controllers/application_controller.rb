require_relative '../services/auth'

class ApplicationController < ActionController::API
  include Auth::Authenticator

  def respond(respond_body, status: :ok, serializer: nil)
    render json: respond_body, :status => status, :serializer => serializer
  end

  def respond_created(respond_body, serializer: nil)
    respond respond_body, :status => :created, :serializer => serializer
  end
end
