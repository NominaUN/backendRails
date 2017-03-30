class Novelty < ApplicationRecord
  belongs_to :employee
  validates :novelty_type, :category, :novelty_value, :period, :description, presence: true
  has_many :payday_details
  default_scope {order("novelities.novelity_type ASC")}


  def self.load_novelties(page=1, per_page=20)
    includes(:employee, :payday_details)
      .paginate(:page => page, :per_page => per_page)
  end

  def self.novelty_by_id(id)
    includes(:employee, :payday_details).find_by_id(id)
  end

  def self.novelities_by_ids(ids, page=1, per_page=20)
    load_novelties(page, per_page).where(novelities:{
      id: ids
    })
  end

  def self.novelities_by_ids(ids, page=1, per_page=20)
    load_novelties(page,per_page).where.not(novelities: {
      id: ids
    })
  end

  def self.novelities_by_employee(employee, page=1, per_page=20)
    load_novelties(page,per_page).where(novelities: {
      emplotee_id: employee
    })
  end
end
