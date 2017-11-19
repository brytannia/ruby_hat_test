class AnswerRules
  def initialize(_quiz, _step)
    @quiz = _quiz
    @step = _step
  end

  def candidate_1
    case @step
      when 1
        1
      when 2
        2
      when 3
        @quiz.answers[0].winner
      when 4
        @quiz.answers[0].looser
      when 5
        @quiz.answers[2].looser
      when 6
        @quiz.answers[2].winner
    end
  end

  def candidate_2
    case @step
      when 1
        3
      when 2
        4
      when 3
        @quiz.answers[1].winner
      when 4
        @quiz.answers[1].looser
      when 5
        @quiz.answers[3].winner
      when 6
        @quiz.answers[4].winner
    end
  end
end
