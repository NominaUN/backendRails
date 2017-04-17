
FactoryGirl.define do

  sequence :area_name do |n|
    "area#{n}"
  end

  factory :area do
    area_name {generate(:area_name)}
  end
end