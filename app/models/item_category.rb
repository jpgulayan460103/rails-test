class ItemCategory < ApplicationRecord
  acts_as_paranoid
  has_many :items, dependent: :nullify
  has_many :item_subcategories, dependent: :destroy
end
