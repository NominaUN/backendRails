class FondEmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :fond_id
  belongs_to :employee
  belongs_to :fond
end
