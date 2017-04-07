require 'test_helper'

class ConceptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concept = concepts(:one)
  end

  test "should get index" do
    get concepts_url, as: :json
    assert_response :success
  end

  test "should create concept" do
    assert_difference('Concept.count') do
      post concepts_url, params: { concept: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show concept" do
    get concept_url(@concept), as: :json
    assert_response :success
  end

  test "should update concept" do
    patch concept_url(@concept), params: { concept: {  } }, as: :json
    assert_response 200
  end

  test "should destroy concept" do
    assert_difference('Concept.count', -1) do
      delete concept_url(@concept), as: :json
    end

    assert_response 204
  end
end
