class Area < ActiveRecord::Base

	validates :area_name, presence: true
  
	#default_scope {order("areas.area_name ASC")}
	scope :area_name, -> (area) {where area_name: area}
	scope :q, -> (q) { where("area_name like ?", "%#{q}%")}
  
	has_many :employees, dependent: :destroy

	def self.load_areas(page=1,per_page=20)
		includes(:employees).paginate(:page => page,:per_page => per_page)
	end
  
	def self.area_by_id(id)
		includes(:employees).find_by_id(id)
	end

end
