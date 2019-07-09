class UsersController < ApplicationController
  def create
    @user = User.create(user_params) if @user.save
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def home
    redirect_to controller: 'users', action: 'new' unless session[:name]
    @user = session[:name]
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
