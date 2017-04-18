require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user= User.new(user_name: "Manuel", user_pass: "123456", user_role: "ADMIN", employee_id: 1)
  end 
 
  test "should be a valid record" do 
	#puts @user
	assert(@user.valid?, "Considered valid the following user: #{@user.attributes}")
  end 
   
  test "employee_id should be present" do 
	@user.employee_id = nil 
	assert_not @user.valid? 
  end 
   
  test "user_name should be present" do 
	@user.user_name = "" 
	assert_not @user.valid? 
  end 
   
  test "user_pass should be present" do 
	@user.user_pass = "" 
	assert_not @user.valid? 
  end 
   
  test "user_role should be present" do 
	@user.user_role = "" 
	assert_not @user.valid? 
  end 
end
