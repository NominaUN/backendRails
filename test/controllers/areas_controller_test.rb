require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area = FactoryGirl.create(:area)
  end

  test "should get index" do
    get api_v1_areas_url, as: :json
    assert_response :success
  end

  test "should create area" do
    assert_difference('Area.count') do
      post api_v1_areas_url, params: { area: {name_area: "areaTest"  } }, as: :json
    end

    assert_response 201
  end

  test "should show area" do
    get api_v1_area_url(@area), as: :json
    assert_response :success
  end

  test "should update area" do
    patch api_v1_area_url(@area), params: { area: { name_area: "updatedArea" } }, as: :json
    assert_response 200
  end

  test "should destroy area" do
    assert_difference('Area.count', -1) do
      delete api_v1_area_url(@area), as: :json
    end

    assert_response 204
  end
end
