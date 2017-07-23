class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :update, :destroy]

  # GET /inspections
  def index
    resources = Inspection.all

    render json: resources
  end

  # GET /inspections/1
  def show
    render json: resource
  end

  # POST /inspections
  def create
    # Inspection.destroy_all
    if resource = Inspection.find_by_category_id_and_task_id(inspection_params[:category_id], inspection_params[:task_id])
      resource.update!(inspection_params)
      log resource, 'resource'
      render json: resource
    else
      resource = Inspection.new(inspection_params)
      if resource.save!
        log Inspection.count, 'count'
        render json: resource, status: :created, location: resource
      else
        render json: resource.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /inspections/1
  def update
    if resource.update(inspection_params)
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inspections/1
  def destroy
    resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      resource = Inspection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inspection_params
      # params.fetch(:inspection, {})
      params.require(:inspection).permit([:category_id, :task_id, :value])
    end
  end
