class AddNotNullValidationToFond < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:fonds, :document_type, false)
	change_column_null(:fonds, :document_number, false)
	change_column_null(:fonds, :business_name, false)
	change_column_null(:fonds, :type_of_fond, false)
  end
end
