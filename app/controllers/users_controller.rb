class UsersController < ApplicationController
    def show 
        # @user = User.find(params[:id])
       @user= User.find_by(id:session[:user_id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save

        flash[:errors] = @user.errors.full_messages
        if @user.valid?
            redirect_to user_path(@user)
        else 
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end 

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :email, :password )
    end
end
