class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = params[:comment][:user_id]
        @listing = Listing.find_by_id(params[:comment][:listing_id])
        if @comment.valid?
        @comment.save
        @listing.comments << @comment
       ## current_user.listing(listing_id from params brought from hidden key) << @listing
    
        redirect_to listing_path(@listing)

        else
            render '/listings/show'
        end
    end
    
    private

    def comment_params
        params.require(:comment).permit(:content, :listing_id, :user_id)
    end

end