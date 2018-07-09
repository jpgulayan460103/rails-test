class Item < ApplicationRecord
    acts_as_paranoid
    attr_accessor :beginning_quantity

    has_many :item_details, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
    validates :unit_of_measure, presence: true
    validates :reorder_level, presence: true, numericality: true
    validates :beginning_quantity, presence: false, numericality: true
    validates :subcategory, presence: true
    validates :dealers_price, presence: true, numericality: true
    validates :retail_price, presence: true, numericality: true
    paginates_per 1

    def remaining_quantity
        ItemDetail.select("sum(quantity) as total").where(item_id: self.id).first.total.to_f
    end
end
