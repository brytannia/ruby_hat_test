class QuizzesController < ApplicationController
  def new
    @quizz = ::Faker::HarryPotter.character.parameterize(separator: '_')
  end

  def create
    quizz_id = params[:quizz]
    quizz = Quiz.create(uid: quizz_id)
    redirect_to new_quiz_answer_path(quizz)
  end
end
