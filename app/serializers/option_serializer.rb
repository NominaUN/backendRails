class OptionSerializer < ActiveModel::Serializer
  attributes :id, :action

  has_many :logs
  has_many :users, through: :logs  
end
