# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  topic_url    :string
#  answer_s_url :string
#  answer_h_url :string
#  answer_r_url :string
#  answer_g_url :string
#

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :quizzes, through: :answers

  def answer(int)
    case int
      when 1
        answer_s_url
      when 2
        answer_h_url
      when 3
        answer_r_url
      when 4
        answer_g_url
    end
  end
end
