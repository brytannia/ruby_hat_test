class QuizzesController < ApplicationController
  def new
    @quiz = ::Faker::HarryPotter.character.parameterize(separator: '_')
  end

  def create
    quiz_id = params[:quiz]
    quiz = Quiz.create(uid: quiz_id)
    redirect_to new_quiz_answer_path(quiz)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end
end
