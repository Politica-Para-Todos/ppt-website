# frozen_string_literal: true

class RenameColumnTextToContentOnManifestoItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :manifesto_items, :text, :content
  end
end
