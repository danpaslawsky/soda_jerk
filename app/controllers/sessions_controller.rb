class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def new
        if !current_user
            @user = User.new
        else 
            redirect_to user_path(current_user)
        end 
    end 


     def destroy
        session.delete :user_id
        redirect_to root_path
    end

end
