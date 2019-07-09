class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    return head(:forbidden) unless authenticated
    @user = user
    session[:user_id] = @user.id
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
