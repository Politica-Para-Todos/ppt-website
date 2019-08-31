# frozen_string_literal: true

class ManifestoItemsController < ApplicationController
  before_action :set_manifesto_item, only: %i[show edit update destroy]

  # GET /manifesto_items
  # GET /manifesto_items.json
  def index
    @manifesto_items = ManifestoItem.all
  end

  # GET /manifesto_items/1
  # GET /manifesto_items/1.json
  def show; end

  # GET /manifesto_items/new
  def new
    @manifesto_item = ManifestoItem.new
  end

  # GET /manifesto_items/1/edit
  def edit; end

  # POST /manifesto_items
  # POST /manifesto_items.json
  def create
    @manifesto_item = ManifestoItem.new(manifesto_item_params)

    respond_to do |format|
      if @manifesto_item.save
        format.html { redirect_to @manifesto_item, notice: 'Manifesto item was successfully created.' }
        format.json { render :show, status: :created, location: @manifesto_item }
      else
        format.html { render :new }
        format.json { render json: @manifesto_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manifesto_items/1
  # PATCH/PUT /manifesto_items/1.json
  def update
    respond_to do |format|
      if @manifesto_item.update(manifesto_item_params)
        format.html { redirect_to @manifesto_item, notice: 'Manifesto item was successfully updated.' }
        format.json { render :show, status: :ok, location: @manifesto_item }
      else
        format.html { render :edit }
        format.json { render json: @manifesto_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manifesto_items/1
  # DELETE /manifesto_items/1.json
  def destroy
    @manifesto_item.destroy
    respond_to do |format|
      format.html { redirect_to manifesto_items_url, notice: 'Manifesto item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manifesto_item
    @manifesto_item = ManifestoItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manifesto_item_params
    params.require(:manifesto_item).permit(:manifesto_section_id, :kind, :position, :text)
  end
end
