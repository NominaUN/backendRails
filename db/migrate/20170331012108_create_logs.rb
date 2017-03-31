class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.timestamp :log_time
      t.references :user, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
