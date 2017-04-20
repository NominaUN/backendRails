FactoryGirl.define do

  sequence :area_name do |n|
    "area#{n}"
  end

  factory :area do
    area_name {generate(:area_name)}
  end
  
  sequence :position_name do |n|
    "position#{n}"
  end

  factory :position do
    position_name {generate(:position_name)}
  end

  factory :fond_employee do
    employee_id 1
    fond_id 1
  end
  
end