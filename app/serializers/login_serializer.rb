class LoginSerializer < ActiveModel::Serializer
  attributes :token
  has_one :user
end
