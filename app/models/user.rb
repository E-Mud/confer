class User < ApplicationRecord
  attr_encrypted :password, key: :pwd_key
  belongs_to :account

  def pwd_key
    Confer::Application.secrets[:pwd_key]
  end
end
