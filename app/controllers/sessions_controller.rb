class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    # render the login form
    def new
    end 

    # process login form
    def create
        #binding.pry
        #user = User.find_by(username: )

    end


     def destroy
        session.delete :user_id
        redirect_to root_path
    end

end
