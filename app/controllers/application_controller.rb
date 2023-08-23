class ApplicationController < ActionController::Base
  helper_method :current_user, :user_questions, :answers_for_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_questions
    @user_questions ||= Question.find_by(user_id: session[:user_id]) if session[:user_id]
  end

  def answers_for_user
    answered = Question.where(user_id: 0, from_user_id: session[:user_id]).map(&:id)
    @answers_for_user ||= Answer.find_by(question_id: answered) if session[:user_id]
  end
end
