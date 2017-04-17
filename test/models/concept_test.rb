require 'test_helper'

class ConceptTest < ActiveSupport::TestCase
  def setup
	@concept = Concept.new(concept_name: "Salario", category: "Devengado")
  end
  
  test "should be valid the concept instance" do
	assert @concept.valid?
  end	
  
  test "concept_name should be present" do
	@concept.concept_name = ""
	assert_not @concept.valid?
  end
  
  test "category should be present" do
	@concept.category = ""
	assert_not @concept.valid?
  end
end
