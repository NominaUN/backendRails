class Position < ActiveRecord::Base

  validates :position_name, presence: true

  default_scope {order("positions.position_name ASC")}
  scope :position_name, ->(position) {where position_name:  position}

  has_many :employees
  
  def self.load_positions(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
  
  def self.position_by_id(id)
    load_positions().where(positions:{
      id: id
    })
  end
  
end
