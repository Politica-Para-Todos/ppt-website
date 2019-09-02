# frozen_string_literal: true

class ManifestosController < ApplicationController
  before_action :set_manifesto, only: [:show]

  # GET /manifestos
  # GET /manifestos.json
  def index
    @manifestos = Manifesto.all
  end

  # GET /manifestos/1
  # GET /manifestos/1.json
  def show; end

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
