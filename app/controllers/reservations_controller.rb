class ReservationsController < ApplicationController
    before_action :authorized

    def index 
        @user=User.all 
        @reservations=Reservation.all
    end
    def show
        @reservation = Reservation.find(params[:id])
    end
    def new
        # @reservation = Reservation.new
      @listing = Listing.find(params[:listing_id])
      @reservation = @listing.reservations.new
#         @listing = Listing.find(params[:listing_id])
#         @reservation = @listing.reservations.new
    end 

    def create 
        # byebug
        # @listing = Listing.find(params[:reservation][:listing_id])
        # @reservation=Reservation.create(reservation_params)
        res_hash=reservation_params
        res_hash[:listing_id]=current_user.id
        @reservation = Reservation.new(res_hash)
        @reservation.guest_id = current_user.id
        @reservation.save
        # redirect_to listing_reservation_path(@listing.id.reservations)
        redirect_to reservation_path(@reservation)
        # "listings/1/reservations/1"
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
