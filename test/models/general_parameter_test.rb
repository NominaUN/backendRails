require 'test_helper'

class GeneralParameterTest < ActiveSupport::TestCase
  def setup
	@general_parameter = GeneralParameter.new(round_type: 100, laboral_days: 5, payday: "QUINCENAL", integral_base: 70.0 )
  end
  
  test "should be valid the general_parameter instance" do
	assert @general_parameter.valid?
  end	
end
