class ApplicationController < ActionController::API
  include ActionController::MimeResponds
end
class Api::V1::PaydayMastersController < ApplicationController
  include SortParams
  before_action :set_payday_master, only: [:show, :update, :destroy]
  before_action :set_payday_master_pdf, only: [:show]
  has_scope :payday_type, :payday_date, :description, :q
  SORTABLE_FIELDS=[:updated_at, :created_at, :payday_type, :payday_date, :description, :q]
  # GET /payday_masters
  def index
    @payday_masters = apply_scopes(PaydayMaster).order(sort_params).load_payday_masters(params[:page], params[:per_page])

    render json: @payday_masters, root: "data"
  end

  # GET /payday_masters/1
  def show
    respond_to do |format|
      format.json {render json: @payday_master, root: "data"}
      format.pdf do
        pdf = PaydayMasterPdf.new(@payday_master,@payday_details_master)
        send_data pdf.render, filename: "liquidation_#{@payday_master.id}.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  # POST /payday_masters
  def create
    @payday_master = PaydayMaster.new(payday_master_params)

    if @payday_master.save
      render json: @payday_master, status: :created, root: "data"
    else
      render json: @payday_master.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /payday_masters/1
  def update
    if @payday_master.update(payday_master_params)
      render json: @payday_master, root: "data"
    else
      render json: @payday_master.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /payday_masters/1
  def destroy
    @payday_master.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payday_master
      @payday_master = PaydayMaster.payday_master_by_id(params[:id])
    end

    def set_payday_master_pdf
      @payday_details_master = PaydayDetail.payday_details_by_payday_master(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payday_master_params
      params.require(:payday_master).permit(:payday_type, :payday_date, :description)
    end
    def sort_params
      SortParams.sorted_fields(params[:sort],SORTABLE_FIELDS)
    end
end
