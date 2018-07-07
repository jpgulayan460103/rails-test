class ReceivingDetail < ApplicationRecord
  belongs_to :receiving
  belongs_to :item, -> {with_deleted}
end
