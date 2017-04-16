require 'test_helper'

class GeneralParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_parameter = general_parameters(:one)
  end

  test "should get index" do
    get api_v1_general_parameters_url, as: :json
    assert_response :success
  end

  test "should create general_parameter" do
    assert_difference('GeneralParameter.count') do
      post api_v1_general_parameters_url, params: { general_parameter: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show general_parameter" do
    get api_v1_general_parameter_url(@general_parameter), as: :json
    assert_response :success
  end

  test "should update general_parameter" do
    patch api_v1_general_parameter_url(@general_parameter), params: { general_parameter: {  } }, as: :json
    assert_response 200
  end

  test "should destroy general_parameter" do
    assert_difference('GeneralParameter.count', -1) do
      delete api_v1_general_parameter_url(@general_parameter), as: :json
    end

    assert_response 204
  end
end
