class AddNotNullValidationToPosition < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:positions, :position_name, false)
  end
end
