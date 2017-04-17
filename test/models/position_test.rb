require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  def setup
	@position = Position.new(position_name: "Manager")
  end
  
  test "should be valid the position instance" do
	assert @position.valid?
  end	
  
  test "position_name should be present" do
	@position.position_name = ""
	assert_not @position.valid?
  end 
end
