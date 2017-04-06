class Area < ActiveRecord::Base
  default_scope {order("areas.name ASC")}
  has_many :employees
end
