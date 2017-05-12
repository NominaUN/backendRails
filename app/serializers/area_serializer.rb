class AreaSerializer < ActiveModel::Serializer
	attributes :id, :area_name
	has_many :employees
end
