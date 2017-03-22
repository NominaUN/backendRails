class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :document_type
      t.string :document_number
      t.string :first_name
      t.string :other_name
      t.string :last_name
      t.string :second_surname
      t.date :birthdate
      t.string :birthplace
      t.string :address
      t.string :phones
      t.string :email
      t.date :admission_date
      t.date :retirement_date
      t.decimal :salary
      t.boolean :transport_aid
      t.boolean :integral_salary
      t.references :area, index: true, foreign_key: true
      t.references :position, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
