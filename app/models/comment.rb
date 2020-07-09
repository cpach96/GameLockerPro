class Comment < ApplicationRecord

    ## RELATIONSHOPS---------------------------
    belongs_to :user
    belongs_to :listing

    ##VALIDATIONS--------------------------------
    validates :content, presence: true
end
