class Api::V1::FondsController < ApplicationController

	include SortParams
  
	before_action :set_fond, only: [:show, :update, :destroy]
  
	has_scope :document_type, :document_number, :business_name, :fond_type, :q

	SORTABLE_FIELDS = [:updated_at, :created_at, :document_type, :document_number, :business_name, :fond_type]
  
	# GET /fonds
	def index
		@fonds = apply_scopes(Fond).order(sort_params).load_fonds(params[:page], params[:per_page])
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
			render json: @fond, status: :created, root: "data"
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
		@fond = Fond.fond_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fond_params
		params.require(:fond).permit(:document_type, :document_number, :business_name, :fond_type)
    end

	def sort_params
		SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS)
	end
	
end