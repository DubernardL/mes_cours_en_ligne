class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
     redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :status, :level, :password, :email)
  end
end

