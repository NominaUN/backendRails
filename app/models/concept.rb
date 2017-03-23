class Concept < ApplicationRecord
  validates :concept_name, :category, presence: true
end
