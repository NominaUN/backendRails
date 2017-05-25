class AddNotNullValidationToNovelty < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:novelties, :novelty_type, false)
    change_column_null(:novelties, :novelty_value, false)
    change_column_null(:novelties, :category, false)
	change_column_null(:novelties, :period, false)
    change_column_null(:novelties, :applied, false)
    change_column_null(:novelties, :description, false)
	change_column_null(:novelties, :percentage1, false)
    change_column_null(:novelties, :percentage2, false)
    change_column_null(:novelties, :percentage3, false)
  end
end
