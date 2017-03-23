class PaydayDetail < ApplicationRecord
  belongs_to :concept
  belongs_to :employee
  belongs_to :novelty
  belongs_to :payday_master
end
