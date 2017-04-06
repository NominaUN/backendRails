class NoveltiesController < ApplicationController
  before_action :set_novelty, only: [:show, :update, :destroy]

  # GET /novelties
  def index
    @novelties = Novelty.all

    render json: @novelties
  end

  # GET /novelties/1
  def show
    render json: @novelty
  end

  # POST /novelties
  def create
    @novelty = Novelty.new(novelty_params)

    if @novelty.save
      render json: @novelty, status: :created, location: @novelty
    else
      render json: @novelty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /novelties/1
  def update
    if @novelty.update(novelty_params)
      render json: @novelty
    else
      render json: @novelty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /novelties/1
  def destroy
    @novelty.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novelty
      @novelty = Novelty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def novelty_params
      params.fetch(:novelty, {})
    end
end
