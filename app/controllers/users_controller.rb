class UsersController < ApplicationController
  def create
    User.create(user_params)
  end

  def home
    redirect_to controller: 'sessions', action: 'new' unless session[:name]
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
