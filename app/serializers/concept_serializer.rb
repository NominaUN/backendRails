class ConceptSerializer < ActiveModel::Serializer
  attributes :id, :concept_name, :category
  
  has_many :payday_details
end
