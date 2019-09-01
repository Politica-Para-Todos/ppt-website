# frozen_string_literal: true

class AddTypeToManifestoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :manifesto_items, :type, :string
  end
end
