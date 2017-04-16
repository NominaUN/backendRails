class Position < ActiveRecord::Base
  default_scope {order("positions.name_position ASC")}
  scope :name_position, ->(position) {where name_position:  position}

  has_many :employees
  
  def self.load_positions(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
  
  def self.position_by_id(id)
    find_by_id(id)
  end

  def self.positions_by_ids(ids, page=1, per_page=20)
    load_positions(page, per_page).where(positions:{
        id: ids
    })
  end

  def self.positions_not_by_ids(ids, page=1, per_page=20)
    load_positions(page,per_page).where.not(positions: {
        id: ids
    })
  end
end
