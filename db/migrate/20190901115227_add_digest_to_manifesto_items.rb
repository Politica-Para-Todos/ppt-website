class AddDigestToManifestoItems < ActiveRecord::Migration[6.0]
  def change
    add_column :manifesto_items, :digest, :string
  end
end
