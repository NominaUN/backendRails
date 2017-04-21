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

  factory :payday_detail do
    base_value 5
    win 3
    loss 2
    appropiation 2
    worked_days 5
    start_date  {1.year.ago}
    end_date {1.month.ago}
    employee_id 1
    concept_id 1
    payday_master_id 1
  end
  
  factory :vacation do
    paid_days 16
    taken_days 15
    start_date Date.new(201713)
    end_date Date.new(2017119)
    employee_id 1
    payday_master_id 1
  end

  factory :log do
    log_time Date.current
    user_id 1
    option_id 1
  end
  
end