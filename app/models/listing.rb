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
    validates :price, numericality: true
    
    #CLASS SCOPE MEDTHOD finds the newest posted game. I then take the class method newest_listing to find the name of it.
    scope :newest, -> { order(:created_at , :desc) }

    #MODEL CLASS METHODS -------------------------

    def self.newest_listing
        Listing.newest.last.name
    end
   
    def created_by?
        self.users.first.username
    end
  


end
