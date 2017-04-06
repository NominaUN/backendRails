class PaydayMastersController < ApplicationController
  before_action :set_payday_master, only: [:show, :update, :destroy]

  # GET /payday_masters
  def index
    @payday_masters = PaydayMaster.all

    render json: @payday_masters
  end

  # GET /payday_masters/1
  def show
    render json: @payday_master
  end

  # POST /payday_masters
  def create
    @payday_master = PaydayMaster.new(payday_master_params)

    if @payday_master.save
      render json: @payday_master, status: :created, location: @payday_master
    else
      render json: @payday_master.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payday_masters/1
  def update
    if @payday_master.update(payday_master_params)
      render json: @payday_master
    else
      render json: @payday_master.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payday_masters/1
  def destroy
    @payday_master.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payday_master
      @payday_master = PaydayMaster.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payday_master_params
      params.fetch(:payday_master, {})
    end
end
