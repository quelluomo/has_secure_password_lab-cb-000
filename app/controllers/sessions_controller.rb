class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
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

  private


end
