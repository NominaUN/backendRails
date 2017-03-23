class PaydayMaster < ApplicationRecord
  validates :payday_type, :payday_date, :description, presence: true
end
