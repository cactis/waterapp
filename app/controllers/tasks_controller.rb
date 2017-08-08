class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    resources = Task.all
    render json: resources
  end

  # GET /tasks/1
  def show
    render json: resource
  end

  # POST /tasks
  def create
    resource = Task.new()
    if resource.save
      render json: resource, status: :created, location: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if resource.update(task_params)
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    resource.destroy
    # render json: resource
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      resource = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      # params.fetch(:task, {})
      params.require(:task).permit()
    end
  end
