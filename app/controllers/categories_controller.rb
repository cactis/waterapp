class CategoriesController < ApplicationController
  respond_to :json
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    if parent_id = params[:category_id]
      log parent_id
      parent = Category.find(parent_id)
      @resources = parent.children
    else
      @resources = Category.roots
    end
    render json: @resources, status: 200
  end

  def show
    render json: @resource
  end

  def new
    @resource = Category.new
  end

  def edit
  end

  def create
    @resource = Category.new(category_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(category_params)
        format.html { redirect_to @resource, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_resource
    @resource = Category.find(params[:id])
  end

  def category_params
    params.fetch(:category, {})
  end
end
