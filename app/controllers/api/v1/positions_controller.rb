class Api::V1::PositionsController < ApplicationController
  before_action :set_position, only: [:show, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.load_positions(params[:page], params[:per_page])
    filtering_params(params).each do |key,value|
      @positions= @positions.public_send(key,value) if value.present?
    end
    render json: @positions, root: "data"
  end

  # GET /positions/1
  def show
    render json: @position
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: @position, status: :created, location: @position, root: "data" 
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
      @position = Position.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      params.permit(:position_name)
      #params.fetch(:position, {})
    end

    def filtering_params(params)
      params.slice(:position_name)
    end
end
