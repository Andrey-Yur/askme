class ApplicationController < ActionController::Base
  require 'pluck_all'

  helper_method :current_user, :user_questions, :answers_for_user, :all_users_nicknames, :get_user_by_id
  # after_action -> { flash[:notice] = nil }, if: -> { request.xhr? }

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

  def all_users_nicknames
    @all_users_nicknames ||= User.where.not(id: current_user.id).pluck_array(:nickname, 'id') if session[:user_id]
  end

  def get_user_by_id(id)
    @user_nickname ||= User.where(id:).pluck(:nickname) if session[:user_id]
  end
end
