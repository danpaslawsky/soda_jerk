class SessionsController < ApplicationController
    # before_action :require_login, only: [:destroy]

    # render the login form
    def new
        if logged_in?
            redirect_to root_path
        end
    end 

    # process login form
    def create
        #binding.pry
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

end
