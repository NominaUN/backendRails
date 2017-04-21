class Api::V1::PaydayMastersController < ApplicationController
  before_action :set_payday_master, only: [:show, :update, :destroy]

  # GET /payday_masters
  def index
    @payday_masters = PaydayMaster.load_payday_masters(params[:page], params[:per_page])

    render json: @payday_masters, root: "data"
  end

  # GET /payday_masters/1
  def show
    render json: @payday_master, root: "data"
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

    # Only allow a trusted parameter "white list" through.
    def payday_master_params
      params.require(:payday_master).permit(:payday_type, :payday_date, :description)
    end
end
