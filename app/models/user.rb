require 'digest/sha1'
class User < ApplicationRecord
    before_save do
        self.password = Digest::SHA1.hexdigest(self.password)
    end
end
