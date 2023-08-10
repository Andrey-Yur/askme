class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)
    user = User.find_by(email: user_params[:email])
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: "You are signed up"
    else
      flash.now[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "You successfully logout"
  end
end