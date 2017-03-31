class Option < ApplicationRecord
	default_scope {order("options.action ASC")}
end
