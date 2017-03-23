class CreatePaydayDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :payday_details do |t|
      t.decimal :base_value
      t.decimal :win
      t.decimal :loss
      t.decimal :appropiation
      t.integer :worked_days
      t.date :initial_date
      t.date :final_date
      t.references :concept, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :novelty, foreign_key: true
      t.references :payday_master, foreign_key: true

      t.timestamps
    end
  end
end
