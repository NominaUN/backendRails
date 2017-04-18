class AddNotNullValidationToOption < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:options, :option_name, false)
    change_column_null(:options, :insert_action, false)
    change_column_null(:options, :update_action, false)
    change_column_null(:options, :delete_action, false)
  end
end
