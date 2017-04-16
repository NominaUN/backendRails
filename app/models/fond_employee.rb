class FondEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :fond
  default_scope {order("fond_employees.employee_id ASC")}

	def self.load_fonds_employees(page=1,per_page=20)
		includes(:employee, :fond)
				.paginate(:page => page,:per_page => per_page)
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
