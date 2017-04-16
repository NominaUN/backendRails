require 'test_helper'
include FactoryGirl::Syntax::Methods
class EmployeeTest < ActiveSupport::TestCase

	def setup
		@area = Area.new(name: "Technology")
		@area.save
		@position = Position.new(name: "Manager")
		@position.save
		
		@employee = Employee.new(position_id: @position.id, area_id: @area.id, document_type: "CC", document_number: 123456, first_name: "Manuel",
									other_name: "Mauricio", last_name: "Perez", second_surname: "Rodriguez", birthdate: Date.new(1990,11,22), birthplace:"Bogota",
									address: "Cra 4 # 22", phones: "7334425", email: "maur@hotmail.com", admission_date: Date.new(2017,1,10),
									retirement_date: Date.new(2017,7,10), salary: 1500000.0, transport_aid: true, integral_salary: false)
		@employee.valid?


		Rails::logger.debug "Errors in employee: #{@employee.errors.messages}"
	end

  test "should be a valid record to save" do
	assert @employee.valid?, "The record: #{@employee.attributes} \n should be ok \n The errors in employee are: #{@employee.errors.messages}"
	end

	test "should be saved as uppercase the document_type" do
		d_t = "cc"
		@employee.document_type=d_t
		@employee.save
		Rails::logger.debug "Errors in employee: #{@employee.errors.messages}"
		assert_equal d_t.upcase, @employee.reload.document_type
	end

	test "should not validate employee with document_number equal to zero" do
		@employee.document_number = 0
		assert_not @employee.valid?, "was not valid because: #{@employee.errors.messages}"
	end

	test "Email should be saved like lowercase" do
		@employee.email="CAMILO@gmail.com"
		@employee.save
		assert_equal @employee.email.downcase, @employee.reload.email, "Error en email lower: #{@employee.errors.messages}"
	end

	test "Should be saved the record created with Factory" do
		@employee2 = FactoryGirl.create(:employee)
		assert @employee2.saved?, "No se pudo guardar objeto: #{@employee2} creado con factory"
	end
end
