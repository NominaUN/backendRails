class Fond < ApplicationRecord
	before_validation {self.document_type.downcase!}
	validates_inclusion_of :document_type, in: %w( cc ce nit)

	validates :document_number, :numericality => { :greater_than => 0 }
	validates :document_type, presence: true
	validates :document_number, presence: true
	validates :business_name, presence: true
	validates :type_of_fond, presence: true
	
	has_many :fond_employees
	has_many :employees, through: :fond_employees

	default_scope {order("fonds.business_name ASC")}

	def load_fonds(page=1,per_page=20)
		includes(fond_employees: :employees)
				.paginate(:page => page,:per_page => per_page)
	end
	##queries
	#

	def self.fond_by_id(id)
		includes(fond_employees: :employees)
				.find_by_id(id)
	end

	def self.fonds_by_ids(ids,page = 1, per_page = 10)
		load_posts(page,per_page)
				.where(fonds:{
						id: ids
				})
	end

	def self.posts_by_not_ids(ids,page = 1, per_page = 10)
		load_posts(page,per_page)
				.where.not(fonds:{
				id: ids
		})
	end


	def fonds_by_employee(employee, page=1, per_page=20 )
		joins(fond_employees: :employees).where(fond_employees:{
			employee_id: employee
		}).paginate(:page => page,:per_page => per_page)
	end
	##fonds by categories

	##fond by razon social

	##fond by id_document
end
