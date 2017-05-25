class PaydayDetailPdf < Prawn::Document
  def initialize(payday_detail)
    super(top_margin: 70)
    @payday_detail = payday_detail
    liquidation_head
    liquidation_info
    liquidation_data
  end
  def liquidation_head
    text "Liquidation \##{@payday_detail.id}", size: 30 , style: :bold
    stroke_horizontal_rule
  end
  def liquidation_info
    pad_top(15){
      text "<b>Employee name:</b>  #{@payday_detail.employee.first_name} #{@payday_detail.employee.other_name} #{@payday_detail.employee.last_name} #{@payday_detail.employee.second_surname} <br/> <b>Document:</b> #{@payday_detail.employee.document_type} #{@payday_detail.employee.document_number}<br/>  <b>Salary:</b> #{@payday_detail.employee.salary}", :inline_format => true, align: :justify
      text "<b>Period:</b> #{@payday_detail.payday_master.payday_date}", :inline_format => true
    }
  end
  def liquidation_data
    pad_top(15){
      text "tabla"
      text "<b>Period:</b> #{@payday_detail.concept}", :inline_format => true
    }
  end
end
