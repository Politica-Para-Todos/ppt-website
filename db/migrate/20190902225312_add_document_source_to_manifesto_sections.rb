class AddDocumentSourceToManifestoSections < ActiveRecord::Migration[6.0]
  def change
    add_column :manifesto_sections, :document_source, :text
  end
end
