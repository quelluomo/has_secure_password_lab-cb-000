class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        render '/users/home'
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  def home
    redirect_to controller: 'users', action: 'new' unless current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
