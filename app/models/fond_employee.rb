class FondEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :fond
end
