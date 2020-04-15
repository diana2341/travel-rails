class ReservationsController < ApplicationController
    def show
        @reservation = Reservation.find(params[:id])
    end
    def new
        @listing = Listing.find(params[:listing_id])
        @reservation = @listing.reservations.new
        # @reservation = Reservation.new
        # @reservation.build_listing
    end 

    def create 
        # byebug
        @listing = Listing.find(params[:reservation][:listing_id])
        # @reservation=Reservation.create(reservation_params)
        @reservation = @listing.reservations.new(reservation_params)
        @reservation.guest_id = current_user.id
        @reservation.save
        # redirect_to listing_reservation_path(@listing.id.reservations)
        redirect_to reservation_path(@reservation)
    end 
    def edit 
        @reservation=Reservation.find(params[:id])
    end 
    def update 
        @reservation=Reservation.find(params[:id])
        @reservation.update(reservation_params)
        @reservation.account_id = current_user.id
        redirect_to confirmation_page_path(@reservation.id)
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
