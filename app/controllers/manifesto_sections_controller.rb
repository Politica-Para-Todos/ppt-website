# frozen_string_literal: true

class ManifestoSectionsController < ApplicationController
  before_action :set_manifesto_section, only: [:show]

  # GET /manifesto_sections/1
  # GET /manifesto_sections/1.json
  def show
    @manifesto_items = @manifesto_section.manifesto_items.sort_by { |section| section.position }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_manifesto_section
    @manifesto_section = ManifestoSection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manifesto_section_params
    params.require(:manifesto_section).permit(:manifesto_id, :manifesto_section_id, :kind, :position, :text)
  end
end
