class Employee < ActiveRecord::Base
  belongs_to :area
  belongs_to :position
  
  has_many :fond_employees
  has_many :fonds, through: :fond_employees
  
  has_many :vacations
end
