require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get api_v1_logs_url, as: :json
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post api_v1_logs_url, params: { log: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show log" do
    get api_v1_log_url(@log), as: :json
    assert_response :success
  end

  test "should update log" do
    patch api_v1_log_url(@log), params: { log: {  } }, as: :json
    assert_response 200
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete api_v1_log_url(@log), as: :json
    end

    assert_response 204
  end
end
