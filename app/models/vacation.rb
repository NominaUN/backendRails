class Vacation < ApplicationRecord
  belongs_to :employee
  validates :paid_days, :taken_days, :start_date, :end_date, presence: true
end
