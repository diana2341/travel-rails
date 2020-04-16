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
