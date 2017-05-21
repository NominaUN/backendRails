class ApplicationController < ActionController::API
  include ActionController::MimeResponds
end
class Api::V1::PaydayDetailsController < ApplicationController
  include SortParams
  before_action :set_payday_detail, only: [:show, :update, :destroy]
  has_scope :base_value, :win, :loss, :appropiation, :worked_days, :start_date, :end_date, :concept_id, :employee_id, :payday_master_id, :q

  SORTABLE_FIELDS = [:update_at, :create_at, :base_value, :win, :loss, :appropiation, :worked_days, :start_date, :end_date, :concept_id, :employee_id, :payday_master_id]
  # GET /payday_details
  def index
    @payday_details = apply_scopes(PaydayDetail).order(sort_params).load_payday_details(params[:page], params[:per_page])

    render json: @payday_details, root: "data"
  end

  # GET /payday_details/1
  def show
    respond_to  do |format|
      format.json {  render json: @payday_detail, root: "data" }
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "hello world"
        send_data pdf.render
      end
    end
  end

  # POST /payday_details
  def create
    @payday_detail = PaydayDetail.new(payday_detail_params)

    if @payday_detail.save
      render json: @payday_detail, status: :created, root: "data"
    else
      render json: @payday_detail.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /payday_details/1
  def update
    if @payday_detail.update(payday_detail_params)
      render json: @payday_detail, root: "data"
    else
      render json: @payday_detail.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /payday_details/1
  def destroy
    @payday_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payday_detail
      @payday_detail = PaydayDetail.payday_detail_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payday_detail_params
      params.require(:payday_detail).permit(:base_value,:win,:loss, :appropiation, :worked_days, :start_date, :end_date, :employee_id,
       :concept_id, :payday_master_id)
    end
    def sort_params
      SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS)
    end
end
