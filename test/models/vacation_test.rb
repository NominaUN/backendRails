require 'test_helper' 
 
class VacationTest < ActiveSupport::TestCase 
   
  def setup 
    @area = Area.new() 
    @area.save 
    @position = Position.new() 
    @position.save 
	
	@pay_master = PaydayMaster.new(payday_type: "tipo 1", payday_date: Date.new(2017,11,29), description: "test")
	@pay_master.save

    @employee = Employee.new(position_id: @position.id, area_id: @area.id, document_type: "cc", document_number: 123456, first_name: "Manuel",
                             other_name: "Mauricio", last_name: "Perez", second_surname: "Rodriguez", birthdate: Date.new(1990,11,22), birthplace:"Bogota",
                             address: "Cra 4 # 22", phones: "7334425", email: "maur@hotmail.com", admission_date: Date.new(2017,1,10),
                             retirement_date: Date.new(2017,7,10), salary: 1500000.0, transport_aid: true, integral_salary: false)
    @employee.save
    Rails::logger.debug "Errors in employee: #{@employee.errors.messages}"
    @vacation= Vacation.new(employee_id: @employee.id, paid_days: 12, taken_days: 14,
				start_date: Date.new(2015, 12, 8), end_date: Date.new(2015, 12, 8), payday_master_id: @pay_master.id)
  end 
 
  test "should be a valid record" do 
  #puts @vacation
  assert(@vacation.valid?, "Considered valid the following vacation: #{@vacation.attributes} \n pay_master: #{@pay_master.attributes}")
  end 
   
  test "employee_id should be present" do 
  @vacation.employee_id = nil 
  assert_not @vacation.valid? 
  end 
   
  test "paid_days should be present" do 
  @vacation.paid_days = nil 
  assert_not @vacation.valid? 
  end 
   
  test "taken_days should be present" do 
  @vacation.taken_days = nil 
  assert_not @vacation.valid? 
  end 
   
  test "start_date should be present" do 
  @vacation.start_date = nil 
  assert_not @vacation.valid? 
  end 
   
  test "document_number should be present" do 
  @vacation.start_date = nil 
  assert_not @vacation.valid? 
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