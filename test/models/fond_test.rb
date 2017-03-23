require 'test_helper'

class FondTest < ActiveSupport::TestCase
  
  def setup
	@fond = Fond.new(document_type: "CC", document_number: 123546, business_name: "Test1", type_of_fond: "Tipo1" )
  end
  
  test "should be valid the fond instance" do
	assert @fond.valid?
  end	
  
  test "document_number should be present" do
	@fond.document_number = nil
	assert_not @fond.valid?
  end
  
  test "document_type should be present" do
	@fond.document_type = ""
	assert_not @fond.valid?
  end
  
  test "business_name should be present" do
	@fond.business_name = ""
	assert_not @fond.valid?
  end
  
  test "type_of_fond should be present" do
	@fond.type_of_fond = ""
	assert_not @fond.valid?
  end
end
