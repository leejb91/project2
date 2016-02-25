class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.admin
      session[:user_id] = user.id
      flash[:notice] = 'Hello admin!'
        if current_user.favorite
          redirect_to favorite_path(current_user.favorite)
        else
          redirect_to root_path
        end
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in!'
      redirect_to root_path
    else
      flash.now.alert = 'Invalid login credentials - try again!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
