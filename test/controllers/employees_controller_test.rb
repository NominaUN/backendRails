require 'test_helper'
include FactoryGirl::Syntax::Methods
class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get api_v1_employees_url, as: :json
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post api_v1_employees_url, params: { employee: { 
                                                      document_type: "CC", 
                                                      document_number: 123124312, 
                                                      first_name: "test", 
                                                      other_name: "test1", 
                                                      last_name: "otro", 
                                                      second_surname: "di", 
                                                      birthdate: Date.new(2011,3,4), 
                                                      birthplace: "casa", 
                                                      address: "call dal", 
                                                      phones: "123123", 
                                                      email: "asd@asda.com", 
                                                      admission_date: Date.new(2016,3,4), 
                                                      salary: 1213.3, 
                                                      transport_aid: false, 
                                                      integral_salary: false, 
                                                      area_id: 1, 
                                                      position_id: 2 } }, as: :json
    end
    assert_response 201
end

  test "should show employee" do
    get api_v1_employee_url(@employee), as: :json
    assert_response :success
  end

  test "should update employee" do
    patch api_v1_employee_url(@employee), params: {  employee: { 
                                                      document_type: "CC", 
                                                      document_number: 123124312, 
                                                      first_name: "test", 
                                                      other_name: "test1", 
                                                      last_name: "otro", 
                                                      second_surname: "di", 
                                                      birthdate: "2016-12-12", 
                                                      birthplace: "casasa", 
                                                      address: "call dal", 
                                                      phones: "123123", 
                                                      email: "asd@asda.com", 
                                                      admission_date: "2017-02-12", 
                                                      salary: "1231.12", 
                                                      transport_aid: false, 
                                                      integral_salary: false, 
                                                      area_id: 1, 
                                                      position_id: 2 }  }, as: :json
    assert_response 200
  end

  test "should destroy employee" do
	skip("make debugging to figure why is not deleting")
    assert_difference('Employee.count', -1) do
      delete api_v1_employee_url(@employee), as: :json
    end

    assert_response 204
  end
end
