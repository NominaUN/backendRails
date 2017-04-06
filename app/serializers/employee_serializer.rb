class EmployeeSerializer < ActiveModel::Serializer
  attributes :id,:document_type,  :document_number, :first_name, :other_name, :last_name, :second_surname, :birthdate, :birthplace,:address, :phones,  :email,  :admission_date, :retirement_date, :salary,
       :transport_aid, :integral_salary
       
    belongs_to :area
    belongs_to :position
    
      has_many :fonds
      has_many :payday_details
      has_many :vacations
      has_many :novelties   
  
end
