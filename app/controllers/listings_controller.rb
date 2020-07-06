class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    def index
        @listings = Listing.all
    end

    def new
       @listing = Listing.new 
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.save
        redirect_to listing_path(@listing)

    end

    def show
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
        @listing.destroy
    end

    private

    def listing_params
        params.require(:listing).permit(:name, :genre, :price, :platform, :publisher)
    end

    def set_listing
        @listing = Listing.find(params[:id])
    end

end
