module ApplicationHelper
    
    
    # memoization
    def current_user
         @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user
    end

    def require_login
        unless current_user
          flash[:notice] = "Please login"
          redirect_to root_url
        end
      end
    
    
    
    def current_path
        #use current path and check to see if it includes user params[:user_id] to render view descriptions accordingly. 
        current_uri = request.env['PATH_INFO']
        if current_uri.include?(current_user.id.to_s)
            return true
        else 
            return false
        end 
    end 
end
