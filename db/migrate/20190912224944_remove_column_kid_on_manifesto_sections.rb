# frozen_string_literal: true

class RemoveColumnKidOnManifestoSections < ActiveRecord::Migration[6.0]
  def change
    remove_column :manifesto_sections, :kind
  end
end
