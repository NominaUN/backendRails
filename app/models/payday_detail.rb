class PaydayDetail < ApplicationRecord
  belongs_to :concept
  belongs_to :employee
  belongs_to :payday_master
#  has_many :novelties,  dependent: :destroy

  validates :base_value, :win, :loss, :appropiation, :worked_days, :start_date, :end_date, presence: true
  
  #default_scope {order("payday_details.start_date ASC")}
  scope :base_value, -> (v) {where base_value: v}
  scope :win, -> (w) {where win: w}
  scope :loss, -> (l) {where loss: l}
  scope :appropiation, -> (a) {where appropiation: a}
  scope :worked_days, -> (d) {where worked_days: d}
  scope :start_date, -> (s) {where start_date: s}
  scope :end_date, -> (e) {where end_date: e}
  scope :concept_id, -> (id) {where concept_id: id}
  scope :employee_id, -> (id) {where employee_id: id}
  scope :payday_master_id, -> (pm) {where payday_master_id: pm}
  scope :q, -> (q) {where("cast(base_value as text) like :h or cast(win as text) like :h or cast(loss as text) like :h or cast(appropiation as text) like :h or cast(worked_days as text) like :h or cast(start_date as text) like :h or cast(end_date as text) like :h or cast(concept_id as text) like :h or cast(employee_id as text) like :h or cast(payday_master_id as text) like :h", h:"%#{q}%")}


  def self.load_payday_details(page=1,per_page=20)
	includes(:concept, :employee, :payday_master)
		.paginate(:page => page,:per_page => per_page)
  end

  def self.payday_detail_by_id(id)
        #    includes(:concept, :employee, :payday_master, :novelties)
 includes(:concept, :employee, :payday_master)
		.find_by_id(id)
  end

  def self.payday_details_by_ids(ids, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        id: ids
    })
  end

  def self.payday_details_not_by_ids(ids, page=1, per_page=20)
    load_payday_details(page,per_page).where.not(payday_details: {
        id: ids
    })
  end

  def self.payday_details_by_concept(concept, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        concept_id: concept
    })
  end
  
  def self.payday_details_by_employee(employee, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        employee_id: employee
    })
  end
   
  def self.payday_details_by_payday_master(payday_master, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        payday_master_id: payday_master
    })
  end
end
