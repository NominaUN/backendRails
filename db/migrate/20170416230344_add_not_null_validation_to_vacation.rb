class AddNotNullValidationToVacation < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:vacations, :paid_days, false)
	change_column_null(:vacations, :taken_days, false)
	change_column_null(:vacations, :start_date, false)
	change_column_null(:vacations, :end_date, false)
	change_column_null(:vacations, :employee_id, false)
	change_column_null(:vacations, :payday_master_id, false)
  end
end
