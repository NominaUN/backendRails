class Api::V1::FondsController < ApplicationController
  before_action :set_fond, only: [:show, :update, :destroy]

  # GET /fonds
  def index
    @fonds = Fond.all

    render json: @fonds
  end

  # GET /fonds/1
  def show
    render json: @fond
  end

  # POST /fonds
  def create
    @fond = Fond.new(fond_params)

    if @fond.save
      render json: @fond, status: :created, location: @fond
    else
      render json: @fond.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fonds/1
  def update
    if @fond.update(fond_params)
      render json: @fond
    else
      render json: @fond.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fonds/1
  def destroy
    @fond.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fond
      @fond = Fond.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fond_params
      params.fetch(:fond, {})
    end
end
