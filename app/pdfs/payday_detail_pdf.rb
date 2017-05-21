class PaydayDetailPdf < Prawn::Document
  def initialize(payday_detail)
    super(top_margin: 70)
    @payday_detail = payday_detail
    liquidation_number
    liquidation_body
  end
  def liquidation_number
    text "Liquidation \##{@payday_detail.id}", size: 30 , style: :bold
    stroke_horizontal_rule
  end
  def liquidation_body
    pad_top(15){
      text "<b>Employee name:</b>  #{@payday_detail.employee.first_name} #{@payday_detail.employee.other_name} #{@payday_detail.employee.last_name} #{@payday_detail.employee.second_surname} <b>Document:</b> #{@payday_detail.employee.document_type} #{@payday_detail.employee.document_number}", :inline_format => true
    }
  end
end
