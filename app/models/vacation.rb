class Vacation < ApplicationRecord
  belongs_to :employee
  belongs_to :payday_master
  validates :paid_days, :taken_days, :start_date, :end_date, presence: true
  validates :paid_days, :taken_days, :numericality =>  {:greater_than => 0}

  #default_scope {order("vacations.start_date ASC")}
  scope :paid_days, -> (d) {where paid_days: d}
  scope :taken_days, -> (d) {where taken_days: d}
  scope :start_date, -> (d) {where start_date: d}
  scope :end_date, -> (d) {where end_date: d}
  scope :employee_id, -> (id) {where employee_id: id}
  scope :payday_master_id, -> (id) {where payday_master_id: id}
  scope :q, -> (q) {where("cast(paid_days as text) like :h or cast(taken_days as text) like :h or cast(start_date as text) like :h or cast(end_date as text) like :h or cast(employee_id as text) like :h or cast(payday_master_id as text) like :h" , h:"%#{q}%")}

  def self.load_vacations(page=1,per_page=20)
	includes(:employee, :payday_master)
		.paginate(:page => page,:per_page => per_page)
  end

  def self.vacation_by_id(id)
    includes(:employee, :payday_master).find_by_id(id)
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
