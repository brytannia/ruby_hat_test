class Question < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :topic_url
      t.string :answer_s_url
      t.string :answer_h_url
      t.string :answer_r_url
      t.string :answer_g_url
    end
  end
end
