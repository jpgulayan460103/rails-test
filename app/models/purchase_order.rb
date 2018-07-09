class PurchaseOrder < ApplicationRecord
  belongs_to :user, -> {with_deleted}, optional: true
end
