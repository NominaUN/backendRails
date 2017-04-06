class User < ApplicationRecord
  belongs_to :employee
  
  validates :username, :password, :role, presence: true
  
  has_many :logs
  has_many :options, through: :logs  
  
  default_scope {order("users.username ASC")}

  def self.load_users(page=1,per_page=20)
    includes(:logs, :options)
        .paginate(:page => page,:per_page => per_page)
  end

  def self.user_by_id(id)
    includes(:logs, :options).find_by_id(id)
  end

  def self.users_by_ids(ids, page=1, per_page=20)
    load_users(page, per_page).where(users:{
        id: ids
    })
  end

  def self.users_not_by_ids(ids, page=1, per_page=20)
    load_users(page,per_page).where.not(users: {
        id: ids
    })
  end
  
  def self.users_by_employee(employee, page=1, per_page=20)
    load_users(page,per_page).where(users: {
      employee_id: employee
    })
  end
end
