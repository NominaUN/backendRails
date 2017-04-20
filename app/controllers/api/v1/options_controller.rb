class Api::V1::OptionsController < ApplicationController
  before_action :set_option, only: [:show, :update, :destroy]

  # GET /options
  def index
    @options = Option.load_options(params[:page], params[:per_page])

    render json: @options, root: "data"
  end

  # GET /options/1
  def show
    render json: @option, root: "data"
  end

  # POST /options
  def create
    @option = Option.new(option_params)

    if @option.save
      render json: @option, status: :created, root: "data"
    else
      render json: @option.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /options/1
  def update
    if @option.update(option_params)
      render json: @option, root: "data"
    else
      render json: @option.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /options/1
  def destroy
    @option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.option_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_params
      params.require(:option).permit(:option_name,:insert_action,:update_action,:delete_action)
    end
end
