class Listing < ApplicationRecord

    # RELATIONSHIPS--------------------------
    has_many :comments
    has_many :users, through: :comments

    #VALIDATIONS -----------------------------
    validates :name, presence: true
    validates :genre, presence: true
    validates :price, presence: true
    validates :publisher, presence: true
    validates :platform, presence: true
    #make validation where price must be integer 


end
