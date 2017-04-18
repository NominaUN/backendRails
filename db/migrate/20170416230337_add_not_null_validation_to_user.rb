class AddNotNullValidationToUser < ActiveRecord::Migration[5.0]
  def change
	change_column_null(:users, :user_name, false)
	change_column_null(:users, :user_pass, false)
	change_column_null(:users, :user_role, false)
	change_column_null(:users, :employee_id, false)
  end
end
