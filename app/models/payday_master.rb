class PaydayMaster < ApplicationRecord
  validates :payday_type, :payday_date, :description, presence: true
  has_many :vacations
  has_many :payday_details
end
