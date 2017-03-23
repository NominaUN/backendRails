class CreateFonds < ActiveRecord::Migration[5.0]
  def change
    create_table :fonds do |t|
      t.string :document_type
      t.integer :document_number
      t.string :business_name
      t.string :type_of_fond

      t.timestamps
    end
  end
end
