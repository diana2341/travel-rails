class LocationsController < ApplicationController
    def show 
        @location = Location.find(params[:id])
    end

    def new 
        @location = Location.new()
    end

    def create 
        @location = Location.new(location_params)
        @location.save

        redirect_to location_path(@location)
    end

    private 

    def location_params
        params.require(:location).permit(:country, :city)
    end 
end
