class CreateOpenLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :open_letters do |t|
      t.text :title
      t.text :body
      t.boolean :active
      t.timestamps
    end

    add_reference :open_letters, :user, index: true, foreign_key: true
  end
end
