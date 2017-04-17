class Api::V1::FondEmployeesController < ApplicationController
  before_action :set_fond_employee, only: [:show, :update, :destroy]

  # GET /fond_employees
  def index
    @fond_employees = FondEmployee.load_fonds_employees(params[:page], params[:per_page])

    render json: @fond_employees, root: "data"
  end

  # GET /fond_employees/1
  def show
    render json: @fond_employee, root: "data"
  end

  # POST /fond_employees
  def create
    @fond_employee = FondEmployee.new(fond_employee_params)

    if @fond_employee.save
      render json: @fond_employee, status: :created, location: @fond_employee, root: "data"
    else
      render json: @fond_employee.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /fond_employees/1
  def update
    if @fond_employee.update(fond_employee_params)
      render json: @fond_employee, root: "data"
    else
      render json: @fond_employee.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /fond_employees/1
  def destroy
    @fond_employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fond_employee
      if params[:byFond]
        @fond_employee = FondEmployee.fonds_employees_by_fond(params[:id], params[:page], params[:per_page])  
      else
        @fond_employee = FondEmployee.fonds_by_id_employee(params[:id], params[:page], params[:per_page])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def fond_employee_params
      params.fetch(:fond_employee, :byFond, :page, :per_page, {})
    end
end
