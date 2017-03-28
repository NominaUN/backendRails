class Area < ActiveRecord::Base
  default_scope {order("areas.name ASC")}
end
