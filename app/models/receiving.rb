class Receiving < ApplicationRecord
  paginates_per 1
  belongs_to :purchase_order, -> {with_deleted}, optional: true
  belongs_to :user, -> {with_deleted}
  has_many :receiving_detail, dependent: :destroy
  # belongs_to :user, class_name: 'User', foreign_key: 'deleted_by'
end
