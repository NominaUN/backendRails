class Api::V1::ConceptsController < ApplicationController
  include SortParams

  SORTABLE_FIELDS = [:updated_at, :created_at, :category, :concept_name]

  #has_scope
  has_scope :category, :concept_name, :q

  before_action :set_concept, only: [:show, :update, :destroy]

  # GET /concepts
  def index
    @concepts = apply_scopes(Concept).order(sort_params).load_concepts( params[:page], params[:per_page])

    render json: @concepts, root: "data"
  end

  # GET /concepts/1
  def show
    render json: @concept, root: "data"
  end

  # POST /concepts
  def create
    @concept = Concept.new(concept_params)

    if @concept.save
      render json: @concept, status: :created,  root: "data"
    else
      render json: @concept.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # PATCH/PUT /concepts/1
  def update
    if @concept.update(concept_params)
      render json: @concept, root: "data"
    else
      render json: @concept.errors, status: :unprocessable_entity, root: "data"
    end
  end

  # DELETE /concepts/1
  def destroy
    @concept.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept
      @concept = Concept.concept_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def concept_params
      params.require(:concept).permit(:concept_name, :category)
      #params.fetch(:concept, :page, :per_page, {})
    end

  def sort_params
    SortParams.sorted_fields(params[:sort], SORTABLE_FIELDS)
  end
end
