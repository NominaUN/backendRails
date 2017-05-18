class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :document_type
      t.integer :document_number
      t.string :first_name
      t.string :other_name
      t.string :last_name
      t.string :second_surname
      t.date :birthdate
      t.string :birthplace
      t.string :address
      t.string :phones
      t.string :email
	  t.string :contract
      t.date :admission_date
      t.date :retirement_date
      t.numeric :salary
      t.boolean :transport_aid
      t.boolean :integral_salary
      t.references :area, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
