class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Invalid username or password.']
      render :new
    end

  end

  def destroy
    session[:session_token] = nil
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
