class User < ApplicationRecord
    has_secure_password

    # RELATIONSHIPS ---------------------------
    has_many :comments
    has_many :listings, through: :comments

    # VALIDATIONS ------------------------------
    validates :username, presence: true
    validates :username, uniqueness: :true
    validates :password, length: {minimum: 6}
    validates :password, length: {maximum: 20}
    

end
