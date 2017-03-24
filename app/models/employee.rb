class Employee < ActiveRecord::Base
  #Make sure that the data is converted downcase in the database to just check for cc ce and nit in the validation process
  before_validation {self.document_type.downcase!}
  before_save {email.downcase!}
  validates :document_number, :numericality => { :greater_than => 0 }
  #Regular expression for emails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :document_type, :document_number, :birthdate, :first_name, :admission_date, :area_id, :birthplace, presence: true
  validates  :last_name, :phones, :position_id, :salary, :transport_aid, :address, presence: true
  validates :email, presence: true, length: {maximum: 255}, format: {with:  VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  belongs_to :area
  belongs_to :position
  
  has_many :fond_employees
  has_many :fonds, through: :fond_employees
  has_many :payday_details
  has_many :vacations
  has_many :novelties
  
  validates_inclusion_of :document_type, in: %w( cc ce nit)
end
