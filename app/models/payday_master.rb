class PaydayMaster < ApplicationRecord
  validates :payday_type, :payday_date, :description, presence: true
  has_many :vacations, dependent: :destroy
  has_many :payday_details, dependent: :destroy
  
  #default_scope {order("payday_masters.payday_date ASC")}
  scope :payday_type, -> (t) {where payday_type: t}
  scope :payday_date, -> (d) {where payday_date: d}
  scope :description, -> (d) {where description: d}
  scope :q, -> (q) {where("payday_type like :h or cast(payday_date as text) like :h or description like :h ",h:"%#{q}%")}
  def self.load_payday_masters(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end

  def self.payday_master_by_id(id)
    includes(:vacations, :payday_details).find_by_id(id)
  end

  def self.payday_masters_by_ids(ids, page=1, per_page=20)
    load_payday_masters(page, per_page).where(payday_masters:{
        id: ids
    })
  end

  def self.payday_masters_not_by_ids(ids, page=1, per_page=20)
    load_payday_masters(page,per_page).where.not(payday_masters: {
        id: ids
    })
  end
end
