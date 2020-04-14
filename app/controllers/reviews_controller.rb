class ReviewsController < ApplicationController
    def new
        @review=Review.new
    end 
    def create 
        @review=Review.create(review_params)
        @review.user_id = current_user.id
        user_id=User.find(params[:id])

       redirect_to listing_path(@reservation.listing)
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
    params.require(:review).permit(:title,:rating,:description)
   end
end
