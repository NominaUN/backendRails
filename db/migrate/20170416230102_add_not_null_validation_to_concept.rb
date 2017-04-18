class AddNotNullValidationToConcept < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:concepts, :concept_name, false)
	change_column_null(:concepts, :category, false)
  end
end
