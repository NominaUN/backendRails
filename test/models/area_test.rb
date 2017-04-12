require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "area creada por medio de factoryGirl" do
    @area = FactoryGirl.create(:area)
    assert @area.persisted?, "No se guardo #{@area}"
  end
  ##probar que se encuentra
end
