class Vacation < ApplicationRecord
  belongs_to :employee
  belongs_to :payday_master
  validates :paid_days, :taken_days, :start_date, :end_date, presence: true
  validates :paid_days, :taken_days, :numericality =>  {greater_than_or_equal_to: 0}
end
