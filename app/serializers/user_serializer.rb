class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :user_pass, :user_role
  
  belongs_to :employee
  has_many :logs
  has_many :options, through: :logs  
end
