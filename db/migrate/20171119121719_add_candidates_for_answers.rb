class AddCandidatesForAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :candidate_1, :integer
    add_column :answers, :candidate_2, :integer
  end
end
