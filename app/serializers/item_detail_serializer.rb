class ItemDetailSerializer < ActiveModel::Serializer
  belongs_to :item
  belongs_to :receiving
  attributes :id, :item_id, :receiving_id
  attribute "cost_price" do |object|
    object.object.cost_price.to_f
  end
  attribute "quantity" do |object|
    object.object.quantity.to_f
  end
end
