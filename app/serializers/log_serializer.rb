class LogSerializer < ActiveModel::Serializer
  attributes :id, :log_time, :user_id, :option_id
end
