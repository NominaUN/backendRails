require 'test_helper'

class LogTest < ActiveSupport::TestCase
  def setup
	@log = Log.new(log_time: Date.new(2015, 12, 8), user_id: 1, option_id: 1)
  end
  
  test "should be valid the log instance" do
	assert @log.valid?
  end	
  
  test "log_time should be present" do
	@log.log_time = ""
	assert_not @log.valid?
  end
  
  test "user_id should be present" do
	@log.user_id = nil
	assert_not @log.valid?
  end
  
  test "option_id should be present" do
	@log.option_id = nil
	assert_not @log.valid?
  end
end
