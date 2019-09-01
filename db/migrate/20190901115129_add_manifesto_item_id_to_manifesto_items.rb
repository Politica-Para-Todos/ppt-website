class AddManifestoItemIdToManifestoItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :manifesto_items, :manifesto_item, null: true, foreign_key: true
  end
end
