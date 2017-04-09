class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :role
  
  belongs_to :employee
  has_many :logs
  has_many :options, through: :logs  
end
