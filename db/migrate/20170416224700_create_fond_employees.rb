class CreateFondEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :fond_employees do |t|
      t.references :employee, foreign_key: true
      t.references :fond, foreign_key: true

      t.timestamps
    end
  end
end
