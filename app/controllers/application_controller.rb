class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :authorized

    def logged_in?
      !current_user.nil?
    end
   
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id:session[:user_id])
      else
        @current_user = nil
      end
    end
     def authorized
      redirect_to login_path unless logged_in?
    end
  end
