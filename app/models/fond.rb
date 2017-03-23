class Fond < ApplicationRecord
	validates :document_type, presence: true
	validates :document_number, presence: true
	validates :business_name, presence: true
	validates :type_of_fond, presence: true
	
	has_many :fond_employees
	has_many :employees, through: :fond_employees
end
