class Api::V1::LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]

  # GET /logs
  def index
    @logs = Log.load_logs(params[:page], params[:per_page])

    render json: @logs, root: "data"
  end

  # GET /logs/1
  def show
    render json: @log, root: "data"
  end

  # POST /logs
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: @log, status: :created, root: "data"
    else
      render json: @log.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @log.update(log_params)
      render json: @log, root: "data"
    else
      render json: @log.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /logs/1
  def destroy
    @log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_params
      params.require(:log).permit(:log_time,:user_id,:option_id)
    end
end
