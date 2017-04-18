require 'test_helper' 
 
class VacationTest < ActiveSupport::TestCase 
   
  def setup 
    @vacation= Vacation.new(employee_id: 1, paid_days: 12, taken_days: 14, start_date: Date.new(2015, 12, 8), end_date: Date.new(2015, 12, 8), 
		payday_master_id: 1)
  end 
 
  test "should be a valid record" do 
	#puts @vacation
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
   
  test "end_date should be present" do 
	@vacation.end_date = nil 
	assert_not @vacation.valid? 
  end
  
  test "payday_master_id should be present" do 
	@vacation.payday_master_id = nil 
	assert_not @vacation.valid? 
  end 
end