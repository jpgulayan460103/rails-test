class Item < ApplicationRecord
    acts_as_paranoid
    validates :name, presence: true, uniqueness: true
    validates :category, numericality: true
    validates :subcategory, numericality: true
    validates :dealers_price, presence: true, numericality: true
    validates :retail_price, presence: true, numericality: true
    paginates_per 50
end
