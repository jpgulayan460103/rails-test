class ItemDetail < ApplicationRecord
  acts_as_paranoid
  belongs_to :item
  # belongs_to :sale, -> {with_deleted}, optional: true
  belongs_to :receiving, -> {with_deleted}, optional: true
  paginates_per 1
end
