class RenameColumnTypeToItemTypeOnManifestoItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :manifesto_items, :type, :item_type
  end
end
