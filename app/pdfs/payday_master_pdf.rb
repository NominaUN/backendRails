class PaydayMasterPdf < Prawn::Document
   def initialize(payday_master, payday_details_master)
    super(top_margin: 70)
    @payday_master = payday_master
    @payday_details_master = payday_details_master
    liquidation_head
    liquidation_info
    liquidation_data
  end
  def liquidation_head
    text "Liquidation \##{@payday_master.id}", size: 30 , style: :bold
    stroke_horizontal_rule
  end
  def liquidation_info
    text "#{@payday_details_master[0].employee.first_name}"
  end
  def liquidation_data
    pad_top(15){
      text "tabla"
    }
  end
end
