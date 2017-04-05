class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :role
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
