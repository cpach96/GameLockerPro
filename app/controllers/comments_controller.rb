class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = params[:comment][:user_id]
        @listing = Listing.find_by_id(params[:comment][:listing_id])
        if @comment.content.empty?
            redirect_to listing_path(@listing)
        else
        @comment.save
        @listing.comments << @comment
        # This if statement is due to a bug splat where a listing cannot be created with no comment. This wont let a comment be made blank manually without validation
       ## current_user.listing(listing_id from params brought from hidden key) << @listing
    
        redirect_to listing_path(@listing)

        end
    end
    
    private

    def comment_params
        params.require(:comment).permit(:content, :listing_id, :user_id)
    end

end