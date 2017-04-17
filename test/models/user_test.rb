require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @area = Area.new(area_name: "Technology")
	@area.save
	@position = Position.new(position_name: "Manager")
	@position.save 

    @employee = Employee.new(position_id: @position.id, area_id: @area.id, document_type: "cc", document_number: 123456, first_name: "Manuel",
                             other_name: "Mauricio", last_name: "Perez", second_surname: "Rodriguez", birthdate: Date.new(1990,11,22), birthplace:"Bogota",
                             address: "Cra 4 # 22", phones: "7334425", email: "maur@hotmail.com", admission_date: Date.new(2017,1,10),
                             retirement_date: Date.new(2017,7,10), salary: 1500000.0, transport_aid: true, integral_salary: false)
    @employee.save
    Rails::logger.debug "Errors in employee: #{@employee.errors.messages}"
    @user= User.new(user_name: "Manuel", user_pass: "123456", user_role: "ADMIN", employee_id: @employee.id)
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
   
  test "email addresses should be unique" do
    duplicate_user = @employee.dup
    duplicate_user.email = @employee.email.upcase
    @employee.save
    assert_not duplicate_user.valid?, "Email duplicated considered valid"
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @employee.email = invalid_address
      assert_not @employee.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @employee.email = valid_address
      assert @employee.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end
