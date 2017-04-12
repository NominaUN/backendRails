class Novelty < ApplicationRecord
  belongs_to :employee
  belongs_to :payday_detail
  validates :novelty_value, :numericality => { :greater_than_or_equal_to => 0 }
  validates :novelty_type, :category, :novelty_value, :period, :description, presence: true
  default_scope {order("novelties.novelty_type ASC")}

  def self.load_novelties(page=1, per_page=20)
    includes(:employee, :payday_detail)
      .paginate(:page => page, :per_page => per_page)
  end

  def self.novelty_by_id(id, page=1, per_page=20)
    load_novelties(page, per_page).where(novelties:{
      id: id
    }).paginate(:page => page, :per_page => per_page)
  end

  def self.novelties_by_ids(ids, page=1, per_page=20)
    load_novelties(page, per_page).where(novelties:{
      id: ids
    }).paginate(:page => page, :per_page => per_page)
  end

  def self.novelties_not_by_ids(ids, page=1, per_page=20)
    load_novelties(page,per_page).where.not(novelties: {
      id: ids
    }).paginate(:page => page, :per_page => per_page)
  end

  def self.novelties_by_employee(employee, page=1, per_page=20)
    load_novelties(page,per_page).where(novelties: {
      employee_id: employee
    }).paginate(:page => page, :per_page => per_page)
  end
  
  def self.novelties_by_payday_detail(payday_detail, page=1, per_page=20)
    load_novelties(page,per_page).where(novelties: {
      payday_detail_id: payday_detail
    })
  end
end
