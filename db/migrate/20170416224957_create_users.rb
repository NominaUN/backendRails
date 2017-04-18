class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_pass
      t.string :user_role
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
