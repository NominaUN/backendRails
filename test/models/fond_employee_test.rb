require 'test_helper'

class FondEmployeeTest < ActiveSupport::TestCase
  def setup
	@fond_employee = FondEmployee.new(employee_id: 1, fond_id: 1)
  end
  
  test "should be valid the fond_employee instance" do
	assert @fond_employee.valid?
  end	
   
  test "employee_id should be present" do
	@fond_employee.employee_id = nil
	assert_not @fond_employee.valid?
  end
  
  test "fond_id should be present" do
	@fond_employee.fond_id = nil
	assert_not @fond_employee.valid?
  end
end
