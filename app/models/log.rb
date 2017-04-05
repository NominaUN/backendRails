class Log < ApplicationRecord
  belongs_to :user
  belongs_to :option
  
  default_scope {order("logs.log_time ASC")}

  def self.load_logs(page=1, per_page=20)
    paginate(:page => page, :per_page => per_page)
  end
end
