class Comment < ApplicationRecord

    ## RELATIONSHOPS---------------------------
    belongs_to :user
    belongs_to :listing, optional: true

    ##VALIDATIONS--------------------------------
    #validates :content, presence: true

  def post_time?
    self.created_at.strftime("%I:%M%p %m/%d/%Y")
  end
end
