class UserSerializer < ActiveModel::Serializer
  attributes :id, username, :password, :role, :employee_id
end
