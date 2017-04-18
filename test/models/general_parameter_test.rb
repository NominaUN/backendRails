require 'test_helper'

class GeneralParameterTest < ActiveSupport::TestCase
  def setup
	@general_parameter = GeneralParameter.new(round_type: 100, laboral_days: 5, payday: "QUINCENAL", integral_base: 70.0 )
  end
  
  test "should be valid the general_parameter instance" do
	assert @general_parameter.valid?
  end

  test "round_type should be present" do
	@general_parameter.round_type = nil
	assert_not @general_parameter.valid?
  end
  
  test "laboral_days should be present" do
	@general_parameter.laboral_days = nil
	assert_not @general_parameter.valid?
  end
  
  test "payday should be present" do
	@general_parameter.payday = ""
	assert_not @general_parameter.valid?
  end
  
  test "integral_base should be present" do
	@general_parameter.integral_base = nil
	assert_not @general_parameter.valid?
  end  
end
