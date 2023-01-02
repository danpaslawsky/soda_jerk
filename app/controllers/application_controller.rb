class ApplicationController < ActionController::Base
    #helper_method :current_user
    
    #root
    def index
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
