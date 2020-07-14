class User < ApplicationRecord
    has_secure_password

    # RELATIONSHIPS ---------------------------
    has_many :comments
    has_many :listings, through: :comments

    # VALIDATIONS ------------------------------
    validates :username, presence: true
    validates :username, uniqueness: :true
    validates :password, length: {minimum: 6}
    validates :password, length: {maximum: 100}

    def self.create_with_omniauth(auth)
        create! do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.username = auth["info"]["name"]
          user.password = SecureRandom.hex
          
          #nickname username
        end
      end
    

end
