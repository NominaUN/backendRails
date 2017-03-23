require 'test_helper' 
 
class VacationTest < ActiveSupport::TestCase 
   
  def setup 
    @area = Area.new() 
    @area.save 
    @position = Position.new() 
    @position.save 
	
	@pay_master = PaydayMaster.new(payday_type: "tipo 1", payday_date: Date.new(2017,11,29), description: "test")
	@pay_master.save
     
    @employee = Employee.new(area_id: @area.id, position_id: @position.id) 
    @employee.save 
    @vacation= Vacation.new(employee_id: @employee.id, paid_days: 12, taken_days: 14,
				start_date: Date.new(2015, 12, 8), end_date: Date.new(2015, 12, 8), payday_master_id: @pay_master.id) 
  end 
 
  test "should be a valid record" do 
  #puts @vacation
  assert(@vacation.valid?, "Considered valid the following vacation: #{@vacation.attributes} \n pay_master: #{@pay_master.attributes}")
  end 
   
  test "employee_id should be present" do 
  @vacation.employee_id = nil 
  assert_not @vacation.valid? 
  end 
   
  test "paid_days should be present" do 
  @vacation.paid_days = nil 
  assert_not @vacation.valid? 
  end 
   
  test "taken_days should be present" do 
  @vacation.taken_days = nil 
  assert_not @vacation.valid? 
  end 
   
  test "start_date should be present" do 
  @vacation.start_date = nil 
  assert_not @vacation.valid? 
  end 
   
  test "document_number should be present" do 
  @vacation.start_date = nil 
  assert_not @vacation.valid? 
  end 
   
end