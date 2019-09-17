# frozen_string_literal: true

class ManifestosController < ApplicationController
  before_action :set_manifesto, only: [:show]

  # GET /manifestos/1
  # GET /manifestos/1.json
  def show
    # only first level sections
    @manifesto_sections = @manifesto.manifesto_sections.where(manifesto_section_id: nil).sort_by { |section| section.position }
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
