class PaydayDetailSerializer < ActiveModel::Serializer
  attributes :id, :base_value, :win, :loss, :appropiation, :worked_days, :start_date, :end_date, :concept_id, :employee_id, :payday_master_id
end
