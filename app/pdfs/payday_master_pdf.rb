# coding: utf-8
require 'prawn'
class PaydayMasterPdf < Prawn::Document
   def initialize(payday_master, payday_details_master)
     super(margin: 70)
    @payday_master = payday_master
    @payday_details_master = payday_details_master
    liquidation_head
    liquidation_info
  end
  def liquidation_head
    text_box "NominaUn ", size: 20 , style: :bold
    text "Liquidación \##{@payday_master.id} ", size: 20 , style: :bold, align: :right
    move_down 5
    stroke_horizontal_rule
    move_down 5
    formatted_text([{ :text => "Tipo: ", :styles => [:bold] },{:text => "#{@payday_master.payday_type  }", :size =>12}])
    formatted_text([{ :text => "Fecha: ", :styles => [:bold] },{:text => "#{@payday_master.payday_date  }", :size =>12}])
    formatted_text([{ :text => "Descripción: ", :styles => [:bold] },{:text => "#{@payday_master.description  }", :size =>12}])
  end
  def liquidation_info
    pad_top(20){
      @payday_details_master.each do |x|
        move_down 5
        stroke_horizontal_rule
        move_down 5
        formatted_text([{ :text => "Nombre: ", :styles => [:bold] },{:text => "#{x.employee.first_name} #{x.employee.other_name} #{x.employee.last_name} #{x.employee.second_surname} ", :size =>12}])
        formatted_text([{ :text => "Documento: ", :styles => [:bold] },{:text => "#{x.employee.document_type} #{x.employee.document_number}", :size =>12}])
        formatted_text([{ :text => "Salario: ", :styles => [:bold] },{:text => "#{x.employee.salary}", :size =>12}])
        move_down 10
        table [["Valor base","Valor ganado", "Valor descontado", "Apropiación", "Dias trabajados","Concepto","Categoria"],
               ["#{x.base_value}","#{x.win}","#{x.loss}","#{x.appropiation}","#{x.worked_days}","#{x.concept.concept_name}","#{x.concept.category}"]],
              :header =>true, :column_widths => [50,50,73,73,65], :cell_style => {:overflow => :shrink_to_fit, :size =>12, :align => :center, :valign => :center}

      end
   }
  end
  def liquidation_data
    pad_top(15){
      text "tabla"
    }
  end
end
