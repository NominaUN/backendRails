class Employee < ActiveRecord::Base
  belongs_to :area
  belongs_to :position
end
