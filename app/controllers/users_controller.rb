class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    
  end

  private 

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
