class ReceivingDetail < ApplicationRecord
  belongs_to :receiving
  belongs_to :item
end
