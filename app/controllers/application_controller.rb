class ApplicationController < ActionController::Base
  helper_method :current_user 
  helper_method :user_questions
    
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  private

  def user_questions
    @user_questions ||= Question.find_by(user_id: session[:user_id]) if session[:user_id]
  end 

end
