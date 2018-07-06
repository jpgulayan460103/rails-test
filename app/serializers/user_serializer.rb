class UserSerializer < ActiveModel::Serializer
  has_many :receiving
  has_many :purchase_order
  attributes :id, :username
end
