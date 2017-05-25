class CreateNovelties < ActiveRecord::Migration[5.0]
  def change
    create_table :novelties do |t|
      t.string :novelty_type
      t.numeric :novelty_value
      t.string :category
      t.integer :period
      t.integer :applied
      t.string :description
      t.numeric :percentage1
      t.numeric :percentage2
      t.numeric :percentage3
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
