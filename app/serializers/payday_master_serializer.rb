class PaydayMasterSerializer < ActiveModel::Serializer
  attributes :id, :payday_type, :payday_date, :description
  
  has_many :vacations
  has_many :payday_details
end
