class Area < ActiveRecord::Base

  validates :area_name, presence: true
  
  default_scope {order("areas.area_name ASC")}
  scope :area_name, -> (nombre) {where area_name: nombre}
  has_many :employees, dependent: :destroy
  def self.load_areas(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
  
  def self.area_by_id(id)
    load_areas().find_by_id(id)
  end
end
