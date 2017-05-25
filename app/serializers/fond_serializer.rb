class FondSerializer < ActiveModel::Serializer
	attributes :id, :document_type, :document_number, :business_name, :fond_type
    has_many :employees, through: :fond_employees
end
