require 'test_helper'

class PaydayDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payday_detail = payday_details(:one)
    @payday_detail2 = FactoryGirl.create(:payday_detail)
  end

  test "should get index" do
    get api_v1_payday_details_url, as: :json
    assert_response :success
  end

  test "should create payday_detail" do
    assert_difference('PaydayDetail.count') do
      post api_v1_payday_details_url, params: { payday_detail: { base_value: 5,
                                                win: 3,
      loss: 2,
      appropiation: 2,
      worked_days: 5,
      start_date:  1.year.ago,
      end_date: 1.month.ago,
      employee_id: 1,
      concept_id: 1,
      payday_master_id: 1  } }, as: :json
    end

    assert_response 201
  end

  test "should show payday_detail" do
    get api_v1_payday_detail_url(@payday_detail), as: :json
    assert_response :success
  end

  test "should update payday_detail" do
    patch api_v1_payday_detail_url(@payday_detail2), params: { payday_detail: { worked_days: 15 } }, as: :json
    assert_response 200
  end

  test "should not  update payday_detail and raise exception" do
    assert_raises ActionController::ParameterMissing do
      patch api_v1_payday_detail_url(@payday_detail2), params: { payday_detail: {  } }, as: :json
    end
    #assert_response 400
  end


  test "should destroy payday_detail" do
    assert_difference('PaydayDetail.count', -1) do
      delete api_v1_payday_detail_url(@payday_detail), as: :json
    end

    assert_response 204
  end
end
