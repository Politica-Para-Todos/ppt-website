# frozen_string_literal: true

class RenameColumnTextToContentOnManifestoSections < ActiveRecord::Migration[6.0]
  def change
    rename_column :manifesto_sections, :text, :content
  end
end
