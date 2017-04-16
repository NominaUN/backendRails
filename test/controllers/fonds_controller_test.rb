require 'test_helper'

class FondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fond = fonds(:one)
  end

  test "should get index" do
    get api_v1_fonds_url, as: :json
    assert_response :success
  end

  test "should create fond" do
    assert_difference('Fond.count') do
      post api_v1_fonds_url, params: { fond: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show fond" do
    get api_v1_fond_url(@fond), as: :json
    assert_response :success
  end

  test "should update fond" do
    patch api_v1_fond_url(@fond), params: { fond: {  } }, as: :json
    assert_response 200
  end

  test "should destroy fond" do
    assert_difference('Fond.count', -1) do
      delete api_v1_fond_url(@fond), as: :json
    end

    assert_response 204
  end
end
