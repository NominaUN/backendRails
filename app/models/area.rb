class Area < ActiveRecord::Base
  default_scope {order("areas.area_name ASC")}
  scope :area_name, -> (nombre) {where area_name: nombre}
  has_many :employees

  def self.load_areas(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
end
