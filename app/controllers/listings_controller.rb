class ListingsController < ApplicationController
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
        @listing = Listing.find(params[:id])
    end

    def edit
        @listing = Listing.find(params[:id]) # DRY THIS UP
    
    end

    def update
        @listing = Listing.find(params[:id])
        @listing.update(listing_params)
        redirect_to listing_path(@listing)
    end

    def destroy
        #will add delete button to edit page that will return you back to your homepage or listing index
    end

    private

    def listing_params
        params.require(:listing).permit(:name, :genre, :price, :platform, :publisher)
    end

end
