require 'test_helper'

class NoveltiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novelty = Novelty.novelty_by_id(1)
  end

  test "should get index" do
    get api_v1_novelties_url, as: :json
    assert_response :success
  end

  test "should create novelty" do
    assert_difference('Novelty.count') do
      post api_v1_novelties_url, params: { novelty: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show novelty" do
    get api_v1_novelty_url(@novelty), as: :json
    assert_response :success
  end

  test "should update novelty" do
    patch api_v1_novelty_url(@novelty), params: { novelty: {  } }, as: :json
    assert_response 200
  end

  test "should destroy novelty" do
    assert_difference('Novelty.count', -1) do
      delete api_v1_novelty_url(@novelty), as: :json
    end

    assert_response 204
  end
end
