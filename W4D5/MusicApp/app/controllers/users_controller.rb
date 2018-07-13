class UsersController < ApplicationController

  def new
    user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      # not sure full_message is correct...full_error?
      # NOPE - full_messages
      render :new
      # not sure if I should be redirecting to another page instead
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
    # not sure expect is correct NOPE! it is permit
  end
end
