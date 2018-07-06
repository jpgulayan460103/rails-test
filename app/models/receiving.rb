class Receiving < ApplicationRecord
  paginates_per 1
  belongs_to :purchase_order
  belongs_to :user
  has_many :receiving_detail
end
