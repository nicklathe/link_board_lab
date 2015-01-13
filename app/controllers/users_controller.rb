class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      # render json: @user
      flash[:sucess] = "User has been created"
      redirect_to login_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:password,:password_confirmation)
  end


end