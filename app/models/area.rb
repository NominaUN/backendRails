class Area < ActiveRecord::Base
  default_scope {order("areas.name_area ASC")}
  scope :name_area, -> (nombre) {where name_area: nombre}
  has_many :employees

  def self.load_areas(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
end
