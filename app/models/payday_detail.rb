class PaydayDetail < ApplicationRecord
  belongs_to :concept
  belongs_to :employee
  belongs_to :payday_master
  validates :base_value, :worked_days, :initial_date, :final_date, presence: true
  
  #default_scope {order("payday_masters.employee ASC")}

  def load_payday_details(page=1,per_page=20)
    includes(:concepts, :employees, :payday_masters)
        .paginate(:page => page,:per_page => per_page)
  end

  def payday_detail_by_id(id)
    includes(:concepts, :employees, :payday_masters).find_by_id(id)
  end

  def payday_details_by_ids(ids, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        id: ids
    })
  end

  def payday_details_not_by_ids(ids, page=1, per_page=20)
    load_payday_details(page,per_page).where.not(payday_details: {
        id: ids
    })
  end

  def payday_details_by_concept(concept, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        concept_id: concept
    })
  end
  
  def payday_details_by_employee(employee, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        employee_id: employee
    })
  end
   
  def payday_details_by_payday_master(payday_master, page=1, per_page=20)
    load_payday_details(page, per_page).where(payday_details:{
        payday_master_id: payday_master
    })
  end
end
