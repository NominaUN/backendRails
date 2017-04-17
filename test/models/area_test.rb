require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  def setup
	@area = Area.new(area_name: "Sales")
  end
  
  test "should be valid the area instance" do
	assert @area.valid?
  end	
  
  test "area_name should be present" do
	@area.area_name = ""
	assert_not @area.valid?
  end 
end
