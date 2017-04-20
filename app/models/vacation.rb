class Vacation < ApplicationRecord
  belongs_to :employee
  belongs_to :payday_master
  validates :paid_days, :taken_days, :start_date, :end_date, presence: true
  validates :paid_days, :taken_days, :numericality =>  {:greater_than => 0}

  default_scope {order("vacations.start_date ASC")}

  def self.load_vacations(page=1,per_page=20)
	includes(:employee, :payday_master)
		.paginate(:page => page,:per_page => per_page)
  end

  def self.vacation_by_id(id,page=1,per_page=20)
    load_vacations(page,per_page)
        .where(vacations:{
            id: id
        })[0]
  end

  def self.vacations_by_ids(ids,page = 1, per_page = 20)
    load_vacations(page,per_page)
        .where(vacations:{
            id: ids
        })
  end

  def self.vacations_by_not_ids(ids,page = 1, per_page = 20)
    load_vacations(page,per_page)
        .where.not(vacations:{
        id: ids
    })
  end

  def self.vacations_by_employee(employee, page=1, per_page=20)
    load_vacations(page,per_page).where(vacations: {
      employee_id: employee
    })
  end

  def self.vacations_by_payday_master(payday_master, page=1, per_page=20)
    load_vacations(page,per_page).where(vacations: {
      payday_master_id: payday_master
    })
  end
end
