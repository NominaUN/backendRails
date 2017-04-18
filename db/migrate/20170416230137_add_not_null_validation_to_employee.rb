class AddNotNullValidationToEmployee < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:employees, :document_type, false)
    change_column_null(:employees, :document_number, false)
    change_column_null(:employees, :birthdate, false)
    change_column_null(:employees, :first_name, false)
    change_column_null(:employees, :admission_date, false)
    change_column_null(:employees, :area_id, false)
    change_column_null(:employees, :birthplace, false)
    change_column_null(:employees, :last_name, false)
    change_column_null(:employees, :phones, false)
    change_column_null(:employees, :position_id, false)
    change_column_null(:employees, :salary, false)
    change_column_null(:employees, :transport_aid, false)
	change_column_null(:employees, :integral_salary, false)
    change_column_null(:employees, :address, false)
    change_column_null(:employees, :email, false)
  end
end
