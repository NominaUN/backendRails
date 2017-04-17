class AddNotNullValidationToArea < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:areas, :area_name, false)
  end
end
