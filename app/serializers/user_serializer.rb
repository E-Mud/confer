class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :account_id
end
