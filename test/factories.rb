
FactoryGirl.define do

  sequence :area_name do |n|
    "area#{n}"
  end

  factory :area do
    name_area {generate(:area_name)}
  end
end