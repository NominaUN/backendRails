require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area = areas(:one)
  end

  test "should get index" do
    get api_v1_areas_url, as: :json
    assert_response :success
  end

  test "should create area" do
    assert_difference('Area.count') do
      post api_v1_areas_url, params: { area: { area_name: "dos" }}, as: :json
      assert_response 201
    end

    
  end

  test "should show area" do
    get api_v1_area_url(@area), as: :json
    assert_response :success
  end

  test "should update area" do
    patch api_v1_area_url(@area), params: { area: { area_name: "uno" } }, as: :json
    assert_response 200
  end

  test "should destroy area" do
    assert_difference('Area.count', -1) do
      delete api_v1_area_url(@area), as: :json
    end

    assert_response 204
  end
end
