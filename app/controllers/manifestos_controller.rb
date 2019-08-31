# frozen_string_literal: true

class ManifestosController < ApplicationController
  before_action :set_manifesto, only: %i[show edit update destroy]

  # GET /manifestos
  # GET /manifestos.json
  def index
    @manifestos = Manifesto.all
  end

  # GET /manifestos/1
  # GET /manifestos/1.json
  def show; end

  # GET /manifestos/new
  def new
    @manifesto = Manifesto.new
  end

  # GET /manifestos/1/edit
  def edit; end

  # POST /manifestos
  # POST /manifestos.json
  def create
    @manifesto = Manifesto.new(manifesto_params)

    respond_to do |format|
      if @manifesto.save
        format.html { redirect_to @manifesto, notice: 'Manifesto was successfully created.' }
        format.json { render :show, status: :created, location: @manifesto }
      else
        format.html { render :new }
        format.json { render json: @manifesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manifestos/1
  # PATCH/PUT /manifestos/1.json
  def update
    respond_to do |format|
      if @manifesto.update(manifesto_params)
        format.html { redirect_to @manifesto, notice: 'Manifesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @manifesto }
      else
        format.html { render :edit }
        format.json { render json: @manifesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manifestos/1
  # DELETE /manifestos/1.json
  def destroy
    @manifesto.destroy
    respond_to do |format|
      format.html { redirect_to manifestos_url, notice: 'Manifesto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manifesto
    @manifesto = Manifesto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manifesto_params
    params.require(:manifesto).permit(:title)
  end
end
