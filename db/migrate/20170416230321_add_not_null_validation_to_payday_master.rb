class AddNotNullValidationToPaydayMaster < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:payday_masters, :payday_type, false)
	change_column_null(:payday_masters, :payday_date, false)
	change_column_null(:payday_masters, :description, false)
  end
end
