class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :answer
      t.timestamps
    end

    add_reference :answers, :survey, index: true, foreign_key: true
    add_reference :answers, :question, index: true, foreign_key: true
    add_reference :answers, :user, index: true, foreign_key: true
  end
end
