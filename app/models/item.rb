class Item < ApplicationRecord
    acts_as_paranoid
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
    validates :subcategory, presence: true
    validates :dealers_price, presence: true, numericality: true
    validates :retail_price, presence: true, numericality: true
    paginates_per 10

    def remaining_quantity
        Item.select("sum(retail_price+dealers_price) as total").first.total.to_f
    end
end
