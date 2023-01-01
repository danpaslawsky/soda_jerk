class ApplicationController < ActionController::Base

    #root
    def index
    end

    #find current user
    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    #verify login to make sure session user_id evaluates to true
    def logged_in?

    end

    def require_login

    end
  

end
