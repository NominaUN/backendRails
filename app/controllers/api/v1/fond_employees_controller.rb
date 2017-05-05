class Api::V1::FondEmployeesController < ApplicationController
  include SortParams
  before_action :set_fond_employee, only: [:show, :update, :destroy]
  has_scope :fond_id, :employee_id, :q
  SORTABLE_FIELDS= [ :fond_id, :employee_id, :id]
  # GET /fond_employees
  def index
    @fond_employees = apply_scopes(FondEmployee).order(sort_params).load_fonds_employees(params[:page], params[:per_page])

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
      render json: @fond_employee, status: :created, root: "data"
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
      @fond_employee = FondEmployee.fond_employees_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fond_employee_params
      params.require(:fond_employee).permit(:employee_id, :fond_id)
      #params.fetch(:fond_employee, :byFond, :page, :per_page, {})
    end
    def sort_params
      SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS)
    end
end
