class FondSerializer < ActiveModel::Serializer
  attributes :id, :document_type, :document_number, :type_of_fond
    has_many :fond_employees
    has_many :employees, through: :fond_employees
end
