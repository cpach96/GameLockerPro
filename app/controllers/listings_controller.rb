class ListingsController < ApplicationController
    
    before_action :require_login
    
    def index
        if params[:user_id]
            @listings = User.find(params[:username]).listings
          else
            @listings = Listing.all
          end
        end

    def new
       @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)
        if @listing.valid?
        @listing.save
        current_user.listings << @listing
    
        ##this works on creating the correct association!!!
        redirect_to listing_path(@listing)

        else
            render :new
        end
    end

    def show
        #testing this
        @comment = Comment.new
        #testing this, this works but its out of scope of this class. comments should not be instanciated in listing class FIX THIS
        set_listing
    end

    def edit
        set_listing    
    end

    def update
        set_listing
        @listing.update(listing_params)
        redirect_to listing_path(@listing)
    end

    def destroy
        #will add delete button to edit page that will return you back to your homepage or listing index
        set_listing
        @listing.destroy
        redirect_to user_path(current_user)
    end

    private

    def listing_params
        params.require(:listing).permit(:name, :genre, :price, :platform, :publisher)
    end

    def set_listing
        @listing = Listing.find(params[:id])
    end

end
