class Position < ActiveRecord::Base
  default_scope {order("positions.name ASC")}
  
  def self.load_positions(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
end
