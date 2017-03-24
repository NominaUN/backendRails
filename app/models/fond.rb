class Fond < ApplicationRecord
	before_validation {self.document_type.downcase!}
	validates_inclusion_of :document_type, in: %w( cc ce nit)

	validates :document_number, :numericality => { :greater_than => 0 }
	validates :document_type, presence: true
	validates :document_number, presence: true
	validates :business_name, presence: true
	validates :type_of_fond, presence: true
	
	has_many :fond_employees
	has_many :employees, through: :fond_employees
end
