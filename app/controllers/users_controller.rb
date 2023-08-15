class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You successfully have signed up"
    else
      flash.now[:alert] = "You put wrong data in form"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "User's data updated"
    else
      flash.now[:alert] = "In an attempt of saving data have existed errors"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "User has deleted"
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end
