# frozen_string_literal: true

class AddVersionToManifestoSections < ActiveRecord::Migration[6.0]
  def change
    add_column :manifesto_sections, :version, :integer
  end
end
