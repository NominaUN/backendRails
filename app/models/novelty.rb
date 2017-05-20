class Novelty < ApplicationRecord
  belongs_to :employee
  validates :novelty_value, :numericality => { :greater_than_or_equal_to => 0 }
  validates :novelty_type, :category, :novelty_value, :period, :description, :applied, presence: true
  #default_scope {order("novelties.novelty_type ASC")}
  scope :novelty_type, -> (t) {where novelty_type: t}
  scope :novelty_value, -> (v) {where novelty_value: v}
  scope :category, -> (c) {where category: c}
  scope :period, -> (p) {where period: p}
  scope :applied, -> (a) {where applied: a}
  scope :description, -> (d) {where description: d}
  scope :percentage1, -> (p) {where percentage1: p}
  scope :percentage2, -> (p) {where percentage2: p}
  scope :percentage3, -> (p) {where percentage3: p}
  scope :employee_id, -> (id) {where employee_id: id}
  scope :q, -> (q) {where("novelty_type like :h or cast(novelty_value as text) like :h or category like :h or cast(period as text) like :h or cast(applied as text) like :h or description like :h or cast(percentage1 as text) like :h or cast(percentage2 as text) like :h or cast(percentage3 as text) like :h or cast(employee_id as text) like :h " , h:"%#{q}%")}


  def self.load_novelties(page=1, per_page=20)
    includes(:employee)
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
  
end
