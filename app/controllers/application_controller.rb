class ApplicationController < ActionController::Base
    include ApplicationHelper 
    
    #root
    def index
        if !logged_in?
            redirect_to login_path
        end
    end

  

end
