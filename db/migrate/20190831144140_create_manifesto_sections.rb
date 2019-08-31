class CreateManifestoSections < ActiveRecord::Migration[6.0]
  def change
    create_table :manifesto_sections do |t|
      t.references :manifesto, null: false, foreign_key: true
      t.references :manifesto_section, null: true, foreign_key: true
      t.string :kind
      t.integer :position
      t.string :text

      t.timestamps
    end
  end
end
