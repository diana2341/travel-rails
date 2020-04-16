class ReviewsController < ApplicationController
    before_action :authorized

    def show
        @review = Review.find(params[:id])      
    end

    def new
        @listing = Listing.find(params[:listing_id])
        @review = Review.new
        @host = @listing.host
    end 
    
    def create 
        @listing = Listing.find(params[:review][:listing_id])
        # @host = User.find(params[:review][:host_id])
        @host = @listing.host
        @review=Review.new(review_params)
        @review.host_id = @host.id
        @review.guest_id = current_user.id
        @review.save
        
        flash[:messages] = @review.errors.full_messages
        if @review.valid?
            redirect_to listing_path(@listing)
        else 
            redirect_to new_listing_review_path(@listing)
        end
    end 

    def edit 
        @review=reservation.find(params[:id])
        @review.update(review_params)
    end 
    def update 
        user_id=User.find(params[:id])
        @review=Review.find(params[:id])
        @review.update(review_params)
        #@review.account_id = current_user.id
        redirect_to listing_path(@reservation.user_id)
    end 
    def destroy
        @review=Review.find(params[:id])
        @review.destroy
    end 
    private 
    def review_params
    params.require(:review).permit(:title,:rating,:description,:listing_id)
   end
end
