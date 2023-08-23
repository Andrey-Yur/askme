class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_question, only: %i[update show destroy edit]

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: "New question has created"
    else
      flash.now[:alert] = "Something went wrong at saving your question"
      render :new

    end
    # @question.save
    # if @question.save
    # # question = Question.create(question_params)
    # # if question.create
    # redirect_to question_path(@question), notice: "New question has created"
    # flash.now[:alert] = "Something went wrong at saving your question"
    # render :new
    # end
    #
  end

  def update
    @question.update(question_params)
    redirect_to questions_path(@question), notice: "Question was updated"
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "Question was deleted"
  end

  def show; end

  def index
    @answers = Answer.where(question_id: Question.where(user_id: 0, from_user_id: session[:user_id]).map(&:id))
    @question = Question.new
    @questions = Question.where(user_id: session[:user_id])
  end

  def new
    @question = Question.new
  end

  def edit; end

  private

  def question_params
    params.require(:question).permit(:body, :user_id, :from_user_id, answer: [:id, :body, :question_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
