# frozen_string_literal: true

class AddAnnotationToManifestoItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :manifesto_items, :annotation, null: true, foreign_key: true
  end
end
