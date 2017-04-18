class FondEmployeeSerializer < ActiveModel::Serializer
  belongs_to :employee
  belongs_to :fond
end
