class Api::V1::EmployeesController < ApplicationController
  include SortParams
  before_action :set_employee, only: [:show, :update, :destroy]
  has_scope :document_type, :document_number, :first_name, :other_name, :last_name, :second_surname, :birthdate, :birthplace, :address, :phones, :email, :contract, :admission_date, :retirement_date, :salary, :transport_aid, :integral_salary, :area_id, :position_id, :q

  SORTABLE_FIELDS = [:updated_at, :created_at, :document_type, :document_number, :first_name, :other_name, :last_name, :second_surname, :birthdate, :birthplace, :address, :phones, :email, :contract, :admission_date, :retirement_date, :salary, :transport_aid, :integral_salary, :area_id, :position_id]
  # GET /employees
  def index
    @employees = apply_scopes(Employee).order(sort_params).load_employees(params[:page], params[:per_page])

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
      render json: @employee, status: :created, root: "data"
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
      @employee = Employee.employee_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:document_type,:document_number,:first_name,:other_name,:last_name,:second_surname,:birthdate,:birthplace,:address,:phones,:email,:contract,:admission_date,:retirement_date,:salary,:transport_aid,:integral_salary,:area_id,:position_id)
    end

    def sort_params
      SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS)
    end
end
