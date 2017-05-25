class Fond < ApplicationRecord

	validates :document_number, :numericality => { :greater_than => 0 }
	validates :document_type, presence: true
	validates :document_number, presence: true
	validates :business_name, presence: true
	validates :fond_type, presence: true
	
	validates_inclusion_of :document_type, in: %w( CC CE NIT)

	#default_scope {order("fonds.business_name ASC")}
	scope :document_type, -> (t) {where document_type: t}
	scope :document_number, -> (n) {where document_number: n}
	scope :business_name, -> (n) {where business_name: n}
	scope :fond_type, -> (t) {where fond_type: t}
	scope :q, -> (q) {where("document_type like ? or business_name like ? or fond_type like ?", "%#{q}%","%#{q}%", "%#{q}%")}

	has_many :fond_employees, dependent: :destroy
	has_many :employees, through: :fond_employees
	
	def self.load_fonds(page=1, per_page=20)
		includes(:employees).paginate(:page => page,:per_page => per_page)
	end

	def self.fond_by_id(id)
		includes(:employees).find_by_id(id)
	end

	def self.fonds_by_ids(ids, page = 1, per_page = 10)
		load_fonds(page,per_page).where(fonds:{	id: ids })
	end

	def self.fonds_not_by_ids(ids,page = 1, per_page = 10)
		load_fonds(page,per_page).where.not(fonds:{ id: ids })
	end

	def self.fonds_by_employee(employee, page=1, per_page=20 )
		joins(:employees).where(fond_employees:{ employee_id: employee }).paginate(:page => page,:per_page => per_page)
	end

	def self.fond_by_type(category, page=1, per_page=20)
		load_fonds(page,per_page).where(fonds:{	fond_type: category })	
	end

	def self.fond_by_name(name, page=1, per_page=20)
		load_fonds(page,per_page).where(fonds:{ business_name: name	})	
	end

	def self.fond_by_document_number(number, page=1, per_page=20)
		load_fonds(page,per_page).where(fonds:{	document_number: number	})	
	end

end
