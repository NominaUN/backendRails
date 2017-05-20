class Employee < ActiveRecord::Base
  before_save {email.downcase!}
  validates :document_number, :numericality => { :greater_than => 0 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :document_type, :document_number, :birthdate, :first_name, :admission_date, :area_id, :birthplace, presence: true
  validates  :last_name, :phones, :position_id, :salary, :address, presence: true
  validates :email, presence: true, length: {maximum: 255}, format: {with:  VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  belongs_to :area
  belongs_to :position
  
  has_many :fond_employees,  dependent: :destroy
  has_many :fonds, through: :fond_employees
  has_many :payday_details,  dependent: :destroy
  has_many :vacations,  dependent: :destroy
  has_many :novelties,  dependent: :destroy
  has_many :users,  dependent: :destroy
   
  validates_inclusion_of :document_type, in: %w( CC CE NIT)

  #default_scope {order("employees.last_name ASC")}

  scope :document_type, -> (document_type) {where document_type: document_type}
  scope :document_number, -> (n) {where document_number: n}
  scope :first_name,-> (n) {where first_name: n}
  scope :other_name, -> (n) {where other_name: n}
  scope :last_name, -> (n) {where last_name: n}
  scope :last_name, -> (n) {where last_name: n}
  scope :second_surname, -> (n) {where second_surname: n}
  scope :birthdate, -> (n) {where birthdate: n}
  scope :birthplace, -> (n) {where birthplace: n}
  scope :address, -> (n) {where address: n}
  scope :phones, -> (p) {where phones: p}
  scope :email, -> (e) {where email: e}
  scope :admission_date, -> (d) {where admission_date: d}
  scope :retirement_date, -> (d) {where retirement_date: d}
  scope :salary, -> (s) {where salary: s}
  scope :transport_aid, -> (t) {where transport_aid: t}
  scope :integral_salary, -> (i) {where integral_salary: i}
  scope :area_id, -> (a) {where area_id: a}
  scope :position_id, -> (i) {where position_id: i}
  scope :q, -> (q){where("document_type like :s or cast(document_number as text) like :s or first_name like :s or other_name like :s or last_name like :s or second_surname like :s or cast(birthdate as text) like :s or birthplace like :s or address like :s or cast(phones as text) like :s or email like :s or cast(admission_date as text) like :s or cast(retirement_date as text) like :s or cast(salary as text) like :s or cast(transport_aid as text) like :s or cast(integral_salary as text) like :s or cast(area_id as text) like :s or cast(position_id as text) like :s", s: "%#{q}%")}


  def self.load_employees(page=1,per_page=20)
    includes(:fonds, :payday_details, :vacations, :novelties, :users, :area, :position)
        .paginate(:page => page,:per_page => per_page)
  end

  def self.employee_by_id(id)
    includes(:fonds, :vacations, :novelties, :users, :area, :position,payday_details: [:payday_master]).find_by_id(id)
  end

  def self.employees_by_ids(ids, page=1, per_page=20)
    load_employees(page, per_page).where(employees:{
        id: ids
    })
  end

  def self.employees_not_by_ids(ids, page=1, per_page=20)
    load_employees(page,per_page).where.not(employees: {
        id: ids
    })
  end

  def self.employees_by_area(area, page=1, per_page=20)
    load_employees(page, per_page).where(employees:{
        area_id: area
    })
  end

  def self.employees_by_position(position, page=1, per_page=20)
    load_employees(page, per_page).where(employees:{
        position_id: position
    })
  end
end
