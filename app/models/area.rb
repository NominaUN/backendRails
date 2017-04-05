class Area < ActiveRecord::Base
  default_scope {order("areas.name ASC")}
  
  def self.load_areas(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
end
