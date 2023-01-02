class ApplicationController < ActionController::Base
    include ApplicationHelper 
    
    #root
    def index
        if !logged_in?
            redirect_to login_path
        end
    end

    # #find current user
    # def current_user
    #     @user = User.find_by(id: session[:user_id])
    # end

    # #verify login to make sure session user_id evaluates to true
    # def logged_in?
    #     !!session[:user_id]
    # end

    # def require_login
    #     if !logged_in?  
    #         flash[:alert] = "Please login to continue" 
    #         redirect_to root_path
    #     end
    # end
  

end
