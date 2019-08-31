# frozen_string_literal: true

class CreateManifestoItems < ActiveRecord::Migration[6.0]
  def change
    create_table :manifesto_items do |t|
      t.references :manifesto_section, null: false, foreign_key: true
      t.string :kind
      t.integer :position
      t.string :text

      t.timestamps
    end
  end
end
