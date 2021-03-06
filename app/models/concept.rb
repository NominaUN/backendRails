class Concept < ApplicationRecord
  validates :concept_name, :category, presence: true
  has_many :payday_details

  #default_scope {order("concepts.concept_name ASC")}
  scope :category, -> (category) {where category: category}
  scope :concept_name, -> (name) {where concept_name: name}
  scope :q, -> (q) {where("category like ? or concept_name like ?","%#{q}%","%#{q}%")}

  def self.load_concepts(page=1, per_page=20)
    includes(:payday_details)
      .paginate(:page => page, :per_page => per_page)
  end

  def self.concept_by_id(id)
    find_by_id(id)
  end

  def self.concepts_by_ids(ids, page=1, per_page=20)
    load_concepts(page, per_page).where(concepts:{
      id: ids
    })
  end

  def self.concepts_not_by_ids(ids, page=1, per_page=20)
    load_concepts(page,per_page).where.not(concepts: {
      id: ids
    })
  end

  def self.concepts_by_category(category, page=1, per_page=20)
    load_concepts(page,per_page).where(concepts: {
      category: category
    })
  end

  def self.concepts_not_by_category(category, page=1, per_page=20)
    load_concepts(page,per_page).where.not(concepts: {
      category: category
    })
  end
end
