class ItemSubcategory < ApplicationRecord
  acts_as_paranoid
  belongs_to :category
end