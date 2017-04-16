require 'test_helper'

class PaydayDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payday_detail = payday_details(:one)
  end

  test "should get index" do
    get api_v1_payday_details_url, as: :json
    assert_response :success
  end

  test "should create payday_detail" do
    assert_difference('PaydayDetail.count') do
      post api_v1_payday_details_url, params: { payday_detail: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show payday_detail" do
    get api_v1_payday_detail_url(@payday_detail), as: :json
    assert_response :success
  end

  test "should update payday_detail" do
    patch api_v1_payday_detail_url(@payday_detail), params: { payday_detail: {  } }, as: :json
    assert_response 200
  end

  test "should destroy payday_detail" do
    assert_difference('PaydayDetail.count', -1) do
      delete api_v1_payday_detail_url(@payday_detail), as: :json
    end

    assert_response 204
  end
end
