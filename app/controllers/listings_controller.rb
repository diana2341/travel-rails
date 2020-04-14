class ListingsController < ApplicationController
    def index
        @listings= Listing.all
    end

    def show
        @listing= Listing.find(params[:id])

    end 

    def new
        @listing = Listing.new
         @listing.build_location

    end

    def create
        @listing = Listing.new(listing_params)
        @listing.host_id = current_user.id

        @listing.save
        
         flash[:errors]= @listing.errors.full_messages
        if @listing.valid?
             redirect_to listing_path(@listing.host)
         else 
             redirect_to new_listing_path
         end 
    end

    def edit
        @listing = Listing.find(params[:id])
    end

    def update 
        @listing = Listing.find(params[:id])
        @listing.update(listing_params)

        redirect_to listing_path(@listing)
    end

    private 
    def listing_params
        params.require(:listing).permit(:title, :description, :address, :rental_type, :price, :amenities,:image, :host_id,location_attributes:[:country, :city])
    end
end
