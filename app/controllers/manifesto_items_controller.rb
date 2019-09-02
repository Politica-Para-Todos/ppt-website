# frozen_string_literal: true

class ManifestoItemsController < ApplicationController
  before_action :set_manifesto_item, only: %i[show]

  # GET /manifesto_items/1
  # GET /manifesto_items/1.json
  def show; end

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
