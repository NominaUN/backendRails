class PaydayDetail < ApplicationRecord
  belongs_to :concept
  belongs_to :employee
  belongs_to :novelty
  belongs_to :payday_master
  validates :base_value, :worked_days, :initial_date, :final_date, presence: true
end
