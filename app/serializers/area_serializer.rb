class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name_area
  has_many :employees
end
