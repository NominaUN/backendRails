require 'test_helper'

class NoveltiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novelty = novelties(:one)
  end

  test "should get index" do
    get api_v1_novelties_url, as: :json
    assert_response :success
  end

  test "should create novelty" do
    assert_difference('Novelty.count') do
      post api_v1_novelties_url, params: { novelty: {
                                                      novelty_type: "Inactividad",
                                                      novelty_value: "0.0",
                                                      category: "Devengado",
                                                      period: 1,
                                                      applied: 0,
                                                      description: "Enfermedad General",
                                                      percentage1: "100.0",
                                                      percentage2: "66.67",
                                                      percentage3: "50.0",
                                                      employee_id: "1"
                                                     } }, as: :json
    end

    assert_response 201
  end

  test "should show novelty" do
    get api_v1_novelty_url(@novelty), as: :json
    assert_response :success
  end

  test "should update novelty" do
    patch api_v1_novelty_url(@novelty), params: { novelty: {
                                                            novelty_type: "Inactividad",
                                                            novelty_value: "0.0",
                                                            category: "Devengado",
                                                            period: 1,
                                                            applied: 0,
                                                            description: "Enfermedad General",
                                                            percentage1: "100.0",
                                                            percentage2: "66.67",
                                                            percentage3: "50.0",
                                                            employee_id:"1"
                                                            } }, as: :json
    assert_response 200
  end

  test "should destroy novelty" do
    assert_difference('Novelty.count', -1) do
      delete api_v1_novelty_url(@novelty), as: :json
    end
    assert_response 204
  end
end
