class AnswersController < ApplicationController
  before_action :set_nickname
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.build_answer
    # @answer = Answer.new
  end

  def show
    @question = Question.find(params[:question_id])
    # NOTE: @answer can be nil here if no answer has been created
    @answer = @question.answer
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      @question.update(user_id: 0)
      redirect_to questions_path, notice: "Answer was sent"
    else
      redirect_to new_question_answers_path(@question), alert: "Something went wrong at saving your answer"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answer
    @question.destroy
    redirect_to questions_path, notice: "Answer was deleted"
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end

  def set_nickname
    @question = Question.find(params[:question_id])
    user = User.find_by(id: @question.from_user_id)
    @nickname = "@#{user.nickname}"
  end
end
