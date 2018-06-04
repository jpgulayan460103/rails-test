class Item < ApplicationRecord
    acts_as_paranoid
    paginates_per 1
end
