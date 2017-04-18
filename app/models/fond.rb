class Fond < ApplicationRecord
	validates_inclusion_of :document_type, in: %w( CC CE NIT)

	validates :document_number, :numericality => { :greater_than => 0 }
	validates :document_type, presence: true
	validates :document_number, presence: true
	validates :business_name, presence: true
	validates :fond_type, presence: true
	
	has_many :fond_employees
	has_many :employees, through: :fond_employees

	default_scope {order("fonds.business_name ASC")}

	def self.load_fonds(page=1, per_page=20)
		includes(:employees)
				.paginate(:page => page,:per_page => per_page)
	end

	def self.fond_by_id(id, page=1,per_page=20)
		includes(:employees)
				.where(fonds:{
						id: id
				}).paginate(:page => page,:per_page => per_page)
	end

	def self.fonds_by_ids(ids, page = 1, per_page = 10)
		load_fonds(page,per_page)
				.where(fonds:{
						id: ids
				})
	end

	def self.fonds_not_by_ids(ids,page = 1, per_page = 10)
		load_fonds(page,per_page)
				.where.not(fonds:{
				id: ids
		})
	end

	def self.fonds_by_employee(employee, page=1, per_page=20 )
		joins(:employees).where(fond_employees:{
			employee_id: employee
		}).paginate(:page => page,:per_page => per_page)
	end
	##fonds by categories
	def self.fond_by_type(category, page=1, per_page=20)
		load_fonds(page,per_page).where(fonds:{
			type_of_fond: category
		})	
	end
	##fond by razon social
	def self.fond_by_name(name, page=1, per_page=20)
		load_fonds(page,per_page).where(fonds:{
			business_name: name	
		})	
	end
	##fond by id_document
	def self.fond_by_document_number(number, page=1, per_page=20)
		load_fonds(page,per_page).where(fonds:{
			document_number: number	
		})	
	end
end
