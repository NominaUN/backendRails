class PaydayMaster < ApplicationRecord
  validates :payday_type, :payday_date, :description, presence: true
  has_many :vacations
  has_many :payday_details
  
  def load_payday_masters(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end

  def payday_master_by_id(id)
    find_by_id(id)
  end

  def payday_masters_by_ids(ids, page=1, per_page=20)
    load_payday_masters(page, per_page).where(payday_masters:{
        id: ids
    })
  end

  def paydaymasters_not_by_ids(ids, page=1, per_page=20)
    load_payday_masters(page,per_page).where.not(payday_masters: {
        id: ids
    })
  end
end
