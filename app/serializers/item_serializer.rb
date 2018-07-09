class ItemSerializer < ActiveModel::Serializer
  has_many :item_details
  attributes :id, :name, :category, :subcategory, :code, :unit_of_measure, :remaining_quantity, :reorder_level
  attribute "retail_price" do |object|
    object.object.retail_price.to_f
  end
  attribute "dealers_price" do |object|
    object.object.dealers_price.to_f
  end
end
