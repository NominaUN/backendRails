class Log < ApplicationRecord
  belongs_to :user
  belongs_to :option
  
  validates :log_time, presence: true
  
  default_scope {order("logs.log_time ASC")}

  def self.load_logs(page=1, per_page=20)
	includes(:user, :option)
		.paginate(:page => page, :per_page => per_page)
  end
  
  def self.log_by_id(id)
    includes(:user, :option).find_by_id(id)
  end

  def self.logs_by_ids(ids, page=1, per_page=20)
    load_logs(page, per_page).where(logs:{
        id: ids
    })
  end

  def self.logs_not_by_ids(ids, page=1, per_page=20)
    load_logs(page,per_page).where.not(logs: {
        id: ids
    })
  end
end
