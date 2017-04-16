class Api::V1::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.load_employees(params[:page], params[:per_page])
    filtering_params(params).each do |key, value|
      @employees = @employees.public_send(key, value) if value.present?
      end
    render json: @employees, root: "data" 
  end

  # GET /employees/1
  def show
    render json: @employee, root: "data"
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee, root: "data"
    else
      render json: @employee.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee, root: "data"
    else
      render json: @employee.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.fetch(:employee, {})
    end

  private

  def filtering_params(params)
    params.slice(:document_number, :document_type)
  end
end
