class Item < ApplicationRecord
    acts_as_paranoid
    has_many :item_detail, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
    validates :subcategory, presence: true
    validates :dealers_price, presence: true, numericality: true
    validates :retail_price, presence: true, numericality: true
    paginates_per 10

    def remaining_quantity
        ItemDetail.select("sum(quantity) as total").where(item_id: self.id).first.total.to_f
    end
end
