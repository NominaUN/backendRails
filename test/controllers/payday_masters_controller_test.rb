require 'test_helper'

class PaydayMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payday_master = payday_masters(:one)
  end

  test "should get index" do
    get payday_masters_url, as: :json
    assert_response :success
  end

  test "should create payday_master" do
    assert_difference('PaydayMaster.count') do
      post payday_masters_url, params: { payday_master: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show payday_master" do
    get payday_master_url(@payday_master), as: :json
    assert_response :success
  end

  test "should update payday_master" do
    patch payday_master_url(@payday_master), params: { payday_master: {  } }, as: :json
    assert_response 200
  end

  test "should destroy payday_master" do
    assert_difference('PaydayMaster.count', -1) do
      delete payday_master_url(@payday_master), as: :json
    end

    assert_response 204
  end
end
