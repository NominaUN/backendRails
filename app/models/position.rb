class Position < ActiveRecord::Base
  default_scope {order("positions.name ASC")}
end
