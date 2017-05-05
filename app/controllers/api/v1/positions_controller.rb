class Api::V1::PositionsController < ApplicationController
  include SortParams
  before_action :set_position, only: [:show, :update, :destroy]
  has_scope :position_name, :q
  SORTABLE_FIELDS=[:updated_at, :created_at, :position_name, :id]
  # GET /positions
  def index
    @positions = apply_scopes(Position).order(sort_params).load_positions(params[:page], params[:per_page])

    render json: @positions, root: "data"
  end

  # GET /positions/1
  def show
    render json: @position, root: "data"
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: @position, status: :created, root: "data" 
    else
      render json: @position.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /positions/1
  def update
    if @position.update(position_params)
      render json: @position, root: "data"
    else
      render json: @position.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /positions/1
  def destroy
    @position.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.position_by_id(params[:id])[0]
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      params.require(:position).permit(:position_name)
    end
    def sort_params
      SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS)
    end
end
