class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :concept_name
      t.string :category

      t.timestamps
    end
  end
end
