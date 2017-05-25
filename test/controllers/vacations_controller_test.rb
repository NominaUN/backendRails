require 'test_helper'

class VacationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacation = vacations(:one)
    @vacation2 = FactoryGirl.create(:vacation)
  end

  test "should get index" do
    get api_v1_vacations_url, as: :json
    assert_response :success
  end

  test "should create vacation" do
    assert_difference('Vacation.count', +1) do
      post api_v1_vacations_url, params: { vacation: { paid_days: 16, taken_days: 15, start_date: Date.new(2017,1,3), end_date: Date.new(2017,1,19), employee_id: 1, payday_master_id: 1 } }, as: :json
    end

    assert_response :success
  end

  test "should show vacation" do
    get api_v1_vacation_url(@vacation), as: :json
    assert_response :success
  end

  test "should update vacation" do
    patch api_v1_vacation_url(@vacation2), params: { vacation: { paid_days: 15, taken_days: 16 } }, as: :json
    assert_response 200
  end

  test "should destroy vacation" do
    assert_difference('Vacation.count', -1) do
      delete api_v1_vacation_url(@vacation), as: :json
    end

    assert_response 204
  end
end
