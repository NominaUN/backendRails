require 'test_helper'

class FondEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fond_employee = fond_employees(:one)
    @fond_employee2 = FactoryGirl.create(:fond_employee)
  end

  test "should get index" do
    get api_v1_fond_employees_url, as: :json
    assert_response :success
  end

  test "should create fond_employee" do
    assert_difference('FondEmployee.count') do
      post api_v1_fond_employees_url, params: { fond_employee: { employee_id: 1, fond_id: 1 } }, as: :json
    end

    assert_response 201
  end

  test "should show fond_employee" do
    get api_v1_fond_employee_url(@fond_employee), as: :json
    assert_response :success
  end

  test "should update fond_employee" do
    patch api_v1_fond_employee_url(@fond_employee2), params: { fond_employee: { fond_id: 1 } }, as: :json
    assert_response 200
  end

  test "should destroy fond_employee" do
    assert_difference('FondEmployee.count', -1) do
      delete api_v1_fond_employee_url(@fond_employee), as: :json
    end

    assert_response 204
  end
end
