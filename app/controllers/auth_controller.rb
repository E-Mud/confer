require_relative '../models/hash'

class AuthController < ApplicationController
  def login
    user = User.find_by(:username => user_params[:username])
    token = generate_token user

    respond ({token: token, user: user}), serializer: LoginSerializer
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
