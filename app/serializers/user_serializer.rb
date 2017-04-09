class UserSerializer < ActiveModel::Serializer
  attributes :id, username, :password, :role, :employee_id
  
  belongs_to :employee
  has_many :logs
end