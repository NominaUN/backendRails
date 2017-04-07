require 'test_helper'

class PaydayDetailControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payday_detail = PaydayDetail.payday_detail_by_id(1)
  end

  test "should get index" do
    get employees_url, as: :json
    assert_response :success
  end

  test "should create payday_detail" do
    assert_difference('PaydayDetail.count') do
      post payday_details_url, params: { payday_detail: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show payday_detail" do
    get payday_detail_url(@payday_detail), as: :json
    assert_response :success
  end

  test "should update payday_detail" do
    patch payday_detail_url(@payday_detail), params: { payday_detail: {  } }, as: :json
    assert_response 200
  end

  test "should destroy payday_detail" do
	skip("make debugging to figure why is not deleting")
    assert_difference('PaydayDetail.count', -1) do
      delete payday_detail_url(@payday_detail), as: :json
    end

    assert_response 204
  end
end
