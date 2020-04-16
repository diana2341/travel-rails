class ReservationsController < ApplicationController
     before_action :authorized

    def index 
        @user = User.find_by(id:current_user.id)

     
    end
    def show
        # @users=guest_id.reservations
        @reservation = Reservation.find(params[:id])
        @reservation.guest_id = current_user.id

    end
    def new
      @listing = Listing.find(params[:listing_id])
      @reservation = @listing.reservations.new
    end 
    
    def create 
        # byebug
        @listing = Listing.find(params[:reservation][:listing_id])
        @reservation=Reservation.new(reservation_params)
        @reservation.confirmation_number = rand(1000...5000)
        @reservation.guest_id = current_user.id
        @reservation.save
        
        flash[:messages]= @reservation.errors.full_messages
        if @reservation.valid?
            redirect_to reservation_path(@reservation)
        else 
            redirect_to new_listing_reservation_path(@listing)
        end
    end 
    
    def edit 
        # @listing = Listing.find(params[:listing_id])
        @reservation=Reservation.find(params[:id])
    end 
    def update 
        # @listing = Listing.find(params[:listing_id])
        @reservation=Reservation.find(params[:id])
        @reservation.confirmation_number = rand(1000...5000)
        @reservation.guest_id = current_user.id
        @reservation.update(reservation_params)
        redirect_to reservation_path(@reservation)
    end 
    def destroy
        @reservation=Reservation.find(params[:id])
        @reservation.destroy
        
    end 
    def confirmation_page
        @user=User.find(params[:id])
        
    end

    private 
    def reservation_params
    params.require(:reservation).permit(:guest_amount, :checkin,:checkout, :confirmation_number, :listing_id)
    end
end
