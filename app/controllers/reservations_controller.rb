class ReservationsController < ApplicationController
    def show
        @reservation = Reservation.find(params[:id])
    end
    def new
        @reservation=Reservation.new
    end 
    def create 
      @reservation=Reservation.create(reservation_params)
      @reservation.account_id = current_user.id
     redirect_to confirmation_page_path(@reservation.id)
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
    params.require(:reservation).permit(:guest_amount, :check_in,:check_out, :confirmation_number )
    end
end
