class AddResponseTypeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :response_type, :text
  end
end
