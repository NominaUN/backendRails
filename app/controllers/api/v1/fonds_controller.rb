class Api::V1::FondsController < ApplicationController
  before_action :set_fond, only: [:show, :update, :destroy]

  # GET /fonds
  def index
    @fonds = Fond.load_fonds(params[:page], params[:per_page])

    render json: @fonds, root: "data"
  end

  # GET /fonds/1
  def show
    render json: @fond, root: "data"
  end

  # POST /fonds
  def create
    @fond = Fond.new(fond_params)

    if @fond.save
      render json: @fond, status: :created, location: @fond, root: "data"
    else
      render json: @fond.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /fonds/1
  def update
    if @fond.update(fond_params)
      render json: @fond, root: "data"
    else
      render json: @fond.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /fonds/1
  def destroy
    @fond.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fond
      @fond = Fond.fond_by_id(params[:id], params[:page], params[:per_page])
    end

    # Only allow a trusted parameter "white list" through.
    def fond_params
      params.fetch(:fond, :page, :per_page, {})
    end
end
