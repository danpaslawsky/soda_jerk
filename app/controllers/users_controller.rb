class UsersController < ApplicationController
  before_action :current_user, only: [:show]
  before_action :require_login, only: [:show]

  # render a signup form
  def new
        if !current_user
            @user = User.new
        else 
            redirect_to user_path(current_user)
        end 
  end 
 
  # processing signup page  
  def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render 'new'
        end 
    end 

    def show
        
    end

  private 

  # Only allow a list of trusted parameters through
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
