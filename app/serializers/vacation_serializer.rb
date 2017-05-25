class VacationSerializer < ActiveModel::Serializer
  attributes :id,:paid_days, :taken_days ,:start_date ,:end_date
  
  belongs_to :employee
  belongs_to :payday_master
end
