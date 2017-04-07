class PaydayDetailsController < ApplicationController
  before_action :set_payday_detail, only: [:show, :update, :destroy]

  # GET /payday_details
  def index
    @payday_details = PaydayDetail.all

    render json: @payday_details
  end

  # GET /payday_details/1
  def show
    render json: @payday_detail
  end

  # POST /payday_details
  def create
    @payday_detail = PaydayDetail.new(payday_detail_params)

    if @payday_detail.save
      render json: @payday_detail, status: :created, location: @payday_detail
    else
      render json: @payday_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payday_details/1
  def update
    if @payday_detail.update(payday_detail_params)
      render json: @payday_detail
    else
      render json: @payday_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payday_details/1
  def destroy
    @payday_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payday_detail
      @payday_detail = PaydayDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payday_detail_params
      params.fetch(:payday_detail, {})
    end
end
