# frozen_string_literal: true

class AddVersionToManifestoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :manifesto_items, :version, :integer
  end
end
