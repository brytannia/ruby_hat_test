class AnswersController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    operator = QuizzOperator.new(@quiz)
    unless operator.finished?
      answer = @quiz.answers.where(responce: nil).first
      answer = answer || operator.select_question
      @question = answer.question
      @answ1 = answer.candidate_1
      @answ2 = answer.candidate_2
    end
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    operator = QuizzOperator.new(@quiz)
    operator.accept_answer(params[:answer])
    redirect_to new_quiz_answer_path(@quiz)
  end
end
