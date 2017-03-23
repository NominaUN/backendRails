class CreateVacations < ActiveRecord::Migration[5.0]
  def change
    create_table :vacations do |t|
      t.references :employee, foreign_key: true
      t.float :paid_days
      t.float :taken_days
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
