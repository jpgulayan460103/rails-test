require 'digest/sha1'
class User < ApplicationRecord
    has_many :receiving
    has_many :purchase_order
    before_save do
        self.password = Digest::SHA1.hexdigest(self.password)
    end
end
