class FondSerializer < ActiveModel::Serializer
  attributes :id, :document_type, :document_number, :business_name, :type_of_fond
    has_many :employees, through: :fond_employees
end
