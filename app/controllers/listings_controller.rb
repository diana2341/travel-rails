class ListingsController < ApplicationController
    # before_action :authorized

    def index
        @listings= Listing.all
    end

    def show
        @review=Review.new
        @reservation=Reservation.new
        @listing= Listing.find_by(id:params[:id])
        # params[:listing_id] = params[:id]
        # byebug
    end 

    def new
        @listing = Listing.new
        @listing.build_location

    end

    def create
        #   post_hash=listing_params
        # post_hash.user_id=@current_user.id
        #   post_hash[:host_id]=current_user
        @listing = Listing.new(listing_params)
        @listing.host_id = current_user.id

        @listing.save
        
         flash[:errors]= @listing.errors.full_messages
        if @listing.valid?
             redirect_to listing_path(@listing)
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
    def destroy
        @listing=Listing.find(params[:id])
        @listing.destroy
        redirect_to user_path(@listing.host_id)
    end 

    private 
    def listing_params
        params.require(:listing).permit(:title, :description, :address, :rental_type, :price, :amenities,:image,  location_attributes:[:country, :city])
    end
end