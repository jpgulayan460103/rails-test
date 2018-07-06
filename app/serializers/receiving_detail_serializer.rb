class ReceivingDetailSerializer < ActiveModel::Serializer
  belongs_to :item
  attributes :id
end
