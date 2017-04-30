class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.integer :group, index: true
      t.text :street_address
      t.timestamps
    end

    add_reference :user_groups, :user, index: true, foreign_key: true
    add_reference :users, :user_group, index: true, foreign_key: true
  end
end
