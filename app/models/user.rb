class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :listings, through: :comments
    #validates :username, presence: true
    #valdiates :username, uniqueness :true

end
