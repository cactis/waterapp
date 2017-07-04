class InstectionsController < ApplicationController
  before_action :set_instection, only: [:show, :update, :destroy]

  # GET /instections
  def index
    @instections = Instection.all

    render json: @instections
  end

  # GET /instections/1
  def show
    render json: @instection
  end

  # POST /instections
  def create
    @instection = Instection.new(instection_params)

    if @instection.save
      render json: @instection, status: :created, location: @instection
    else
      render json: @instection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instections/1
  def update
    if @instection.update(instection_params)
      render json: @instection
    else
      render json: @instection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /instections/1
  def destroy
    @instection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instection
      @instection = Instection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def instection_params
      params.fetch(:instection, {})
    end
end
