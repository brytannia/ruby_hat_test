class QuizzOperator
  def initialize(_quiz)
    @quiz = _quiz
  end

  def accept_answer(_answer)
    answer = @quiz.answers.where(responce: nil).first
    answer.update_attributes(responce: _answer)
    if @quiz.answers.size == 6
      @quiz.update_attributes finished: true
    end
  end

  def select_question
    answered_ids = @quiz.questions.pluck(:id)
    question = Question.where.not(id: answered_ids).sample
    rules = AnswerRules.new(@quiz, answered_ids.size + 1)
    Answer.create(quiz: @quiz,
                  question: question,
                  candidate_1: rules.candidate_1,
                  candidate_2: rules.candidate_2)
  end

  def finished?
    @quiz.finished?
  end

  def verdict
    finished? ? @quiz.answers[5].responce_code : nil
  end
end
