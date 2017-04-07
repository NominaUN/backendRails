class PaydayMasterSerializer < ActiveModel::Serializer
  attributes :id, :payday_type, :payday_date, :description
end
