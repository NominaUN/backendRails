class AddNotNullValidationToPaydayDetail < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:payday_details, :base_value, false)
    change_column_null(:payday_details, :win, false)
    change_column_null(:payday_details, :loss, false)
    change_column_null(:payday_details, :appropiation, false)
    change_column_null(:payday_details, :worked_days, false)
    change_column_null(:payday_details, :start_date, false)
    change_column_null(:payday_details, :end_date, false)
  end
end
