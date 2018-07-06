class ReceivingSerializer < ActiveModel::Serializer
  has_many :receiving_detail
  belongs_to :user
  attributes :id, :user_id
end
