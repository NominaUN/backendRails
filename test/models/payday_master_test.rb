require 'test_helper'

class PaydayMasterTest < ActiveSupport::TestCase
  def setup
	@payday_master = PaydayMaster.new(payday_type: "Nomina", payday_date: Date.new(2017,11,29), description: "test")
  end
  
  test "should be valid the payday_master instance" do
	assert @payday_master.valid?
  end	
  
  test "payday_type should be present" do
	@payday_master.payday_type = ""
	assert_not @payday_master.valid?
  end
  
  test "payday_date should be present" do
	@payday_master.payday_date = ""
	assert_not @payday_master.valid?
  end
  
  test "description should be present" do
	@payday_master.description = ""
	assert_not @payday_master.valid?
  end
end
