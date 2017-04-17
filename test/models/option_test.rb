require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
	@option = Option.new(option_name: "Borrar Empleados", insert_action: true, update_action: true, delete_action: true )
  end
  
  test "should be valid the option instance" do
	assert @option.valid?
  end	
  
  test "option_name should be present" do
	@option.option_name = ""
	assert_not @option.valid?
  end 
end
