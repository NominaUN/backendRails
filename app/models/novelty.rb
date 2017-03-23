class Novelty < ApplicationRecord
  belongs_to :employee
  validates :novelty_type, :category, :novelty_value, :period, :description, presence: true
end
