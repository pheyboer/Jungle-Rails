# User controller for registration
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    # added get request for test
    if request.get?
      @user = User.new
      render :new  # render signup form for GET requests
      return
    end

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Account Created Successfully!'
    else
      flash.now[:notice] = 'Account was unable to be created'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      )
      
  end
end