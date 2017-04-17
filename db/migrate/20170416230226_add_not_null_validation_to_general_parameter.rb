class AddNotNullValidationToGeneralParameter < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:general_parameters, :round_type, false)
    change_column_null(:general_parameters, :laboral_days, false)
	change_column_null(:general_parameters, :payday, false)
    change_column_null(:general_parameters, :integral_base, false)
  end
end
