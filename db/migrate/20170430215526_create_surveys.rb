class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.text :slug, index: true
      t.text :label
      t.timestamps
    end

    add_reference :surveys, :user, index: true, foreign_key: true
  end
end
