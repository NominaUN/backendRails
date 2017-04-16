class Employee < ActiveRecord::Base
  before_validation {uppercase_document_type}
  before_save {email.downcase!}
  validates :document_number, :numericality => { :greater_than => 0 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :document_type, :document_number, :birthdate, :first_name, :admission_date, :area_id, :birthplace, presence: true
  validates  :last_name, :phones, :position_id, :salary, :address, presence: true
  validates :email, presence: true, length: {maximum: 255}, format: {with:  VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  belongs_to :area
  belongs_to :position
  
  has_many :fond_employees
  has_many :fonds, through: :fond_employees
  has_many :payday_details
  has_many :vacations
  has_many :novelties
  has_many :users
  
  def uppercase_document_type
    document_type.upcase!
  end
  
  validates_inclusion_of :document_type, in: %w( CC CE NIT)

  default_scope {order("employees.last_name ASC")}

  def self.load_employees(page=1,per_page=20)
    includes(:fonds, :payday_details, :vacations, :novelties, :users)
        .paginate(:page => page,:per_page => per_page)
  end

  def self.employee_by_id(id)
    includes(:fonds, :payday_details, :vacations, :novelties, :users).find_by_id(id)
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