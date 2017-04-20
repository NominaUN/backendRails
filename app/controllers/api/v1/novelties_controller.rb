class Api::V1::NoveltiesController < ApplicationController
  before_action :set_novelty, only: [:show, :update, :destroy]

  # GET /novelties
  def index
    @novelties = Novelty.load_novelties(params[:page], params[:per_page])

    render json: @novelties, root: "data"
  end

  # GET /novelties/1
  def show
    render json: @novelty, root: "data"
  end

  # POST /novelties
  def create
    @novelty = Novelty.new(novelty_params)

    if @novelty.save
      render json: @novelty, status: :created,  root: "data"
    else
      render json: @novelty.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /novelties/1
  def update
    if @novelty.update(novelty_params)
      render json: @novelty, root: "data"
    else
      render json: @novelty.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /novelties/1
  def destroy
    @novelty.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novelty
      @novelty = Novelty.novelty_by_id(params[:id])[0]
    end

    # Only allow a trusted parameter "white list" through.
    def novelty_params
      params.require(:novelty).permit(:novelty_type,:novelty_value,:category,:period,:applied,:description,:percentage1,:percentage2,:percentage3, :employee_id, :payday_detail_id)
    end
end
