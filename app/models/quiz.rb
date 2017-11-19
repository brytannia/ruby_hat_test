# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  uid        :string
#  finished   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers
end
