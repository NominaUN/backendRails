class CreateGeneralParameters < ActiveRecord::Migration[5.0]
  def change
    create_table :general_parameters do |t|
      t.integer :round_type
      t.integer :laboral_days
      t.string :payday
      t.numeric :integral_base
	  t.boolean :auto_liquidation

      t.timestamps
    end
  end
end
