class Answers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :quiz
      t.references :question
      t.integer :responce
      t.timestamps
    end
  end
end
