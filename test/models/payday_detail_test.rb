require 'test_helper'

class PaydayDetailTest < ActiveSupport::TestCase
  def setup 
    @payday_detail= PaydayDetail.new(base_value: 1000000.0, win: 100000.0, loss: 0.0, appropiation: 0.0, worked_days: 15.0, start_date: Date.new(2017,1,1), 
		end_date: Date.new(2017,1,15), concept_id: 1, employee_id: 1, payday_master_id: 1)
  end 
 
  test "should be a valid record" do 
	#puts @payday_detail
	assert @payday_detail.valid?
  end 
   
  test "base_value should be present" do 
	@payday_detail.base_value = nil 
	assert_not @payday_detail.valid? 
  end 
   
  test "win should be present" do 
	@payday_detail.win = nil 
	assert_not @payday_detail.valid? 
  end 
   
  test "loss should be present" do 
	@payday_detail.loss = nil 
	assert_not @payday_detail.valid? 
  end 
   
  test "appropiation should be present" do 
	@payday_detail.appropiation = nil 
	assert_not @payday_detail.valid? 
  end 
   
  test "worked_days should be present" do 
	@payday_detail.worked_days = nil 
	assert_not @payday_detail.valid? 
  end
  
  test "start_date should be present" do 
	@payday_detail.start_date = "" 
	assert_not @payday_detail.valid? 
  end

  test "end_date should be present" do 
	@payday_detail.end_date = "" 
	assert_not @payday_detail.valid? 
  end 

  test "concept_id should be present" do 
	@payday_detail.concept_id = nil 
	assert_not @payday_detail.valid? 
  end   

  test "employee_id should be present" do 
	@payday_detail.employee_id = nil 
	assert_not @payday_detail.valid? 
  end 

  test "payday_master_id should be present" do 
	@payday_detail.payday_master_id = nil 
	assert_not @payday_detail.valid? 
  end
end
