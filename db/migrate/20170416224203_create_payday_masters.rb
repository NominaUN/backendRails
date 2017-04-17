class CreatePaydayMasters < ActiveRecord::Migration[5.0]
  def change
    create_table :payday_masters do |t|
      t.string :payday_type
      t.date :payday_date
      t.string :description

      t.timestamps
    end
  end
end
