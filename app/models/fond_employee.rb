class FondEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :fond
  #default_scope {order("fond_employees.employee_id ASC")}
  scope :fond_id, -> (id) {where fond_id: id}
  scope :employee_id, -> (id) {where employee_id: id}
  scope :q, -> (q) {where("cast(fond_id as text) like :h or cast(employee_id as text) like :h", h:"%#{q}%")}

	def self.load_fonds_employees(page=1,per_page=20)
		includes(:employee, :fond)
				.paginate(:page => page,:per_page => per_page)
	end

	def self.fond_employees_by_id(id)
		includes(:employee, :fond).find_by_id(id)
	end

	def self.fonds_by_id_employee(id, page=1, per_page=20)
		includes(:employee, :fond)
				.where(employee_id: id)
				.paginate(:page => page,:per_page => per_page)
	end

	def self.fonds_employees_by_fond(fond, page=1, per_page=20 )
		includes(:employee, :fond)
				.where(fond_id: fond)
				.paginate(:page => page,:per_page => per_page)
	end
  
end
