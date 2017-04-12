class Position < ActiveRecord::Base
  default_scope {order("positions.name_position ASC")}
  scope :name_position, ->(position) {where name_position:  position}

  has_many :employees
  
  def self.load_positions(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
end
