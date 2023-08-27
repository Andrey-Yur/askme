class SessionsController < ApplicationController
  def new; end

  def create
    user_params = params.require(:session)
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])
    if user.present?
      session[:user_id] = user.id
      redirect_to questions_path, notice: "You are successfully login"
    else
      flash.now[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to({ action: 'new' }, { notice: "You successfully logout" })

    # redirect_to({ path: new_session_path }, { notice: "You successfully logout" })
  end
end
