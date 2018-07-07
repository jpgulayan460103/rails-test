class Receiving < ApplicationRecord
  paginates_per 1
  belongs_to :purchase_order, -> {with_deleted}
  belongs_to :user, -> {with_deleted}
  has_many :receiving_detail, dependent: :destroy
end
