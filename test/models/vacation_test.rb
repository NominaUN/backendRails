require 'test_helper' 
 
class VacationTest < ActiveSupport::TestCase 
   
  def setup 
    @area = Area.new() 
    @area.save 
    @position = Position.new() 
    @position.save 
     
    @employee = Employee.new(area_id: @area.id, position_id: @position.id) 
    @employee.save 
    @vacation= Vacation.new(employee_id: @employee.id, paid_days: 12, taken_days: 14, start_date: Date.new(2015, 12, 8), end_date: Date.new(2015, 12, 8)) 
  end 
 
  test "should be a valid record" do 
  assert @vacation.valid? 
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