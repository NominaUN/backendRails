class GeneralParameter < ApplicationRecord
	
  validates :round, :laboral_days, :payday, :integral_base, presence: true
	
  def self.load_general_parameters(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
end
