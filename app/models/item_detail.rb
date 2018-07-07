class ItemDetail < ApplicationRecord
  acts_as_paranoid
  belongs_to :item
  # belongs_to :sale, -> {with_deleted}
  belongs_to :receiving, -> {with_deleted}
  paginates_per 1
end
