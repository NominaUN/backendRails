class Area < ActiveRecord::Base

  validates :area_name, presence: true
  
  default_scope {order("areas.area_name ASC")}
  scope :area_name, -> (area) {where area_name: area}
  
  has_many :employees, dependent: :destroy

  def self.load_areas(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
  
  def self.area_by_id(id)
    includes(:employees).find_by_id(id)
  end

end
