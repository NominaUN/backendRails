class Option < ApplicationRecord
  
  validates :action, presence: true

  has_many :logs
  has_many :users, through: :logs  
   
  default_scope {order("options.action ASC")}
  
  def self.load_options(page=1,per_page=20)
	include(:logs, :users)
		.paginate(:page => page,:per_page => per_page)
  end
  
  def self.option_by_id(id)
    include(:logs, :users).find_by_id(id)
  end
  
  def self.options_by_ids(ids, page=1, per_page=20)
    load_options(page, per_page).where(options:{
        id: ids
    })
  end

  def self.options_not_by_ids(ids, page=1, per_page=20)
    load_options(page,per_page).where.not(options: {
        id: ids
    })
  end
end
