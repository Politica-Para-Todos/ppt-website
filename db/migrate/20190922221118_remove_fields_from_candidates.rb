class RemoveFieldsFromCandidates < ActiveRecord::Migration[6.0]
  def change
    remove_column :candidates, :description
    remove_column :candidates, :description_source
  end
end
