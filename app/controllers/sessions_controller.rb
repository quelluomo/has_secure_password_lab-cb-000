class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      return head(:forbidden)
    end
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end
end
