class CreateVacations < ActiveRecord::Migration[5.0]
  def change
    create_table :vacations do |t|
      t.numeric :paid_days
      t.numeric :taken_days
      t.date :start_date
      t.date :end_date
      t.references :employee, foreign_key: true
      t.references :payday_master, foreign_key: true

      t.timestamps
    end
  end
end
