class NoveltySerializer < ActiveModel::Serializer
  attributes :id, :novelty_type, :novelty_value, :category, :period, :applied, :description, :percentage1, :percentage2, :percentage3
  
  
  belongs_to :employee
  belongs_to :payday_detail
            
end
