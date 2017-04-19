require 'test_helper'

class ConceptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concept = concepts(:one)
  end

  test "should get index" do
    get api_v1_concepts_url, as: :json
    assert_response :success
  end

  test "should create concept" do
    assert_difference('Concept.count') do
      post api_v1_concepts_url, params: { concept: {concept_name: "Salud", category: "Devengado" } }, as: :json
    end

    assert_response 201
  end

  test "should show concept" do
    get api_v1_concept_url(@concept), as: :json
    assert_response :success
  end

  test "should update concept with just concept_name" do
    patch api_v1_concept_url(@concept), params: { concept: {concept_name: "Pension"  } }, as: :json
    assert_response 200
  end

  test "should update concept with just category" do
    patch api_v1_concept_url(@concept), params: { concept: {category: "Deducido"  } }, as: :json
    assert_response 200
  end

  test "should destroy concept" do
    assert_difference('Concept.count', -1) do
      delete api_v1_concept_url(@concept), as: :json
    end

    assert_response 204
  end
end
