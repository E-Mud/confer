class AccountController < ApplicationController
  def signup
    new_user = user_params

    account = Account.create

    new_user[:account] = account
    created_user = User.create(new_user)

    respond_created created_user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
