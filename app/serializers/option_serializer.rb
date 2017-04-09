class OptionSerializer < ActiveModel::Serializer
  attributes :id, :action, :insert_action, :update_action, :delete_action

  has_many :logs
  has_many :users, through: :logs  
end
