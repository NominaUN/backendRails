class CreatePaydayDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :payday_details do |t|
      t.numeric :base_value
      t.numeric :win
      t.numeric :loss
      t.numeric :appropiation
      t.numeric :worked_days
      t.date :start_date
      t.date :end_date
      t.references :concept, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :payday_master, foreign_key: true

      t.timestamps
    end
  end
end
