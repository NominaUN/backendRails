class Api::V1::VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :update, :destroy]

  # GET /vacations
  def index
    @vacations = Vacation.load_vacations(params[:page], params[:per_page])

    render json: @vacations, root: "data"
  end

  # GET /vacations/1
  def show
    render json: @vacation, root: "data"
  end

  # POST /vacations
  def create
    @vacation = Vacation.new(vacation_params)

    if @vacation.save
      render json: @vacation, status: :created, location: @vacation, root: "data"
    else
      render json: @vacation.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /vacations/1
  def update
    if @vacation.update(vacation_params)
      render json: @vacation, root: "data"
    else
      render json: @vacation.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /vacations/1
  def destroy
    @vacation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vacation_params
      params.fetch(:vacation, {})
    end
end
