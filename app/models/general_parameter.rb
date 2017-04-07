class GeneralParameter < ApplicationRecord
	
  validates :round_type, :laboral_days, :payday, :integral_base, presence: true
	
  def self.load_general_parameters(page=1,per_page=20)
    paginate(:page => page,:per_page => per_page)
  end
  
  def self.general_parameter_by_id(id)
    find_by_id(id)
  end

  def self.general_parameters_by_ids(ids, page=1, per_page=20)
    load_general_parameters(page, per_page).where(general_parameters:{
        id: ids
    })
  end

  def self.general_parameters_not_by_ids(ids, page=1, per_page=20)
    load_general_parameters(page,per_page).where.not(general_parameters: {
        id: ids
    })
  end
end
