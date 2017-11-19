class Quiz < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :uid
      t.boolean :finished, default: false
      t.timestamps
    end
  end
end
