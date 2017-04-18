class LogSerializer < ActiveModel::Serializer
  attributes :id, :log_time, :user_id, :option_id
  
  belongs_to :user
  belongs_to :option
end
