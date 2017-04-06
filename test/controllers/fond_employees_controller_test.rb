require 'test_helper'

class FondEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fond_employee = fond_employees(:one)
  end

  test "should get index" do
    get fond_employees_url, as: :json
    assert_response :success
  end

  test "should create fond_employee" do
    assert_difference('FondEmployee.count') do
      post fond_employees_url, params: { fond_employee: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show fond_employee" do
    get fond_employee_url(@fond_employee), as: :json
    assert_response :success
  end

  test "should update fond_employee" do
    patch fond_employee_url(@fond_employee), params: { fond_employee: {  } }, as: :json
    assert_response 200
  end

  test "should destroy fond_employee" do
    assert_difference('FondEmployee.count', -1) do
      delete fond_employee_url(@fond_employee), as: :json
    end

    assert_response 204
  end
end
