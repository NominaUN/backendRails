class FondEmployeeSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :employee
  belongs_to :fond
end
