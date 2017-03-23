class CreateNovelties < ActiveRecord::Migration[5.0]
  def change
    create_table :novelties do |t|
      t.string :novelty_type
      t.string :category
      t.decimal :novelty_value
      t.integer :period
      t.integer :applied
      t.string :description
      t.decimal :percentage1
      t.decimal :percentage2
      t.decimal :percentage3
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
