# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  quiz_id     :integer
#  question_id :integer
#  responce    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  candidate_1 :integer
#  candidate_2 :integer
#

class Answer < ApplicationRecord
  belongs_to :quiz
  belongs_to :question

  # enum responce: [:slytherin, :hufflepuff, :ravenclaw, :gryffindor]

  def winner
    responce == candidate_1 ? candidate_1 : candidate_2
  end

  def looser
    responce == candidate_1 ? candidate_2 : candidate_1
  end

  def responce_code
    case responce
      when 0
        :green
      when 1
        :yellow
      when 2
        :blue
      when 3
        :red
    end
  end
end
