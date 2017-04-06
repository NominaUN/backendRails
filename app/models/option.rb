class Option < ApplicationRecord
  default_scope {order("options.action ASC")}
  
  def self.load_options(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
  
  def self.option_by_id(id)
    find_by_id(id)
  end
end
