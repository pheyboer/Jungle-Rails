# Session controller for login/logout

class SessionsController < ApplicationController
  def new
  end

  def create

    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Log in Successful'
    else
      flash.now[:alert] = 'Invalid Email or Password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are now Logged out'
  end
end
