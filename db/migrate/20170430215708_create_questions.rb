class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :slug, index: true
      t.text :label
      t.timestamps
    end

    add_reference :questions, :survey, index: true, foreign_key: true
  end
end
