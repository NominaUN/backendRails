class AddNotNullValidationToFondEmployee < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:fond_employees, :employee_id, false)
    change_column_null(:fond_employees, :fond_id, false)
  end
end
