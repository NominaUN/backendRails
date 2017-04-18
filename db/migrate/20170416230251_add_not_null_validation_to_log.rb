class AddNotNullValidationToLog < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:logs, :log_time, false)
    change_column_null(:logs, :user_id, false)
    change_column_null(:logs, :option_id, false)
  end
end
