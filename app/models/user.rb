class User < ApplicationRecord
    has_secure_password
    #validates :username, presence: true
    #valdiates :username, uniqueness :true

end
