require 'test_helper'

class NoveltyTest < ActiveSupport::TestCase
  def setup 
    @novelty= Novelty.new(novelty_type: "Devengado", novelty_value: 100000.0, category: "Novedad", period: 1, applied: 0, description: "Prestamo",
		percentage1: 0, percentage2: 0, percentage3: 0, employee_id: 1, payday_detail_id: 1)
  end 
 
  test "should be a valid record" do 
	#puts @novelty
	assert @novelty.valid?
  end 
   
  test "novelty_type should be present" do 
	@novelty.novelty_type = "" 
	assert_not @novelty.valid? 
  end 
   
  test "novelty_value should be present" do 
	@novelty.novelty_value = nil 
	assert_not @novelty.valid? 
  end 
   
  test "category should be present" do 
	@novelty.category = "" 
	assert_not @novelty.valid? 
  end 
   
  test "period should be present" do 
	@novelty.period = nil 
	assert_not @novelty.valid? 
  end 
   
  test "applied should be present" do 
	@novelty.applied = nil 
	assert_not @novelty.valid? 
  end
  
  test "description should be present" do 
	@novelty.description = "" 
	assert_not @novelty.valid? 
  end

  test "percentage1 should be present" do 
	@novelty.percentage1 = nil 
	assert_not @novelty.valid? 
  end 

  test "percentage2 should be present" do 
	@novelty.percentage2 = nil 
	assert_not @novelty.valid? 
  end 

  test "percentage3 should be present" do 
	@novelty.percentage3 = nil 
	assert_not @novelty.valid? 
  end   

  test "employee_id should be present" do 
	@novelty.employee_id = nil 
	assert_not @novelty.valid? 
  end 

  test "payday_detail_id should be present" do 
	@novelty.payday_detail_id = nil 
	assert_not @novelty.valid? 
  end
end
