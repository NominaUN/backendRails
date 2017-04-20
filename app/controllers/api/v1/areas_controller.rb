class Api::V1::AreasController < ApplicationController
  before_action :set_area, only: [:show, :update, :destroy]

  # GET /areas
  def index
    @areas = Area.load_areas(params[:page], params[:per_page])

    render json: @areas, root: "data"
  end

  # GET /areas/1
  def show
    render json: @area, root: "data"
  end

  # POST /areas
  def create
    @area = Area.new(area_params)

    if @area.save
      render json: @area, status: :created, root: "data"
    else
      render json: @area.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /areas/1
  def update
    if @area.update(area_params)
      render json: @area, root: "data"
    else
      render json: @area.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /areas/1
  def destroy
    @area.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.area_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_params
      params.require(:area).permit(:area_name)
    end

end
