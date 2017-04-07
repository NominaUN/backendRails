class Api::V1::FondEmployeesController < ApplicationController
  before_action :set_fond_employee, only: [:show, :update, :destroy]

  # GET /fond_employees
  def index
    @fond_employees = FondEmployee.all

    render json: @fond_employees
  end

  # GET /fond_employees/1
  def show
    render json: @fond_employee
  end

  # POST /fond_employees
  def create
    @fond_employee = FondEmployee.new(fond_employee_params)

    if @fond_employee.save
      render json: @fond_employee, status: :created, location: @fond_employee
    else
      render json: @fond_employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fond_employees/1
  def update
    if @fond_employee.update(fond_employee_params)
      render json: @fond_employee
    else
      render json: @fond_employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fond_employees/1
  def destroy
    @fond_employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fond_employee
      @fond_employee = FondEmployee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fond_employee_params
      params.fetch(:fond_employee, {})
    end
end
