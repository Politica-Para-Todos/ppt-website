# frozen_string_literal: true

class RenameColumnContentToTitleOnManifestoSections < ActiveRecord::Migration[6.0]
  def change
    rename_column :manifesto_sections, :content, :title
  end
end
