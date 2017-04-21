class Api::V1::GeneralParametersController < ApplicationController
  before_action :set_general_parameter, only: [:show, :update, :destroy]

  # GET /general_parameters
  def index
    @general_parameters = GeneralParameter.load_general_parameters(params[:page], params[:per_page])

    render json: @general_parameters, root: "data"
  end

  # GET /general_parameters/1
  def show
    render json: @general_parameter, root: "data"
  end

  # POST /general_parameters
  def create
    @general_parameter = GeneralParameter.new(general_parameter_params)

    if @general_parameter.save
      render json: @general_parameter, status: :created, root: "data"
    else
      render json: @general_parameter.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /general_parameters/1
  def update
    if @general_parameter.update(general_parameter_params)
      render json: @general_parameter, root: "data"
    else
      render json: @general_parameter.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /general_parameters/1
  def destroy
    @general_parameter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_parameter
      @general_parameter = GeneralParameter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def general_parameter_params
      params.require(:general_parameter).permit(:round_type, :laboral_days, :payday, :integral_base)
    end
end
