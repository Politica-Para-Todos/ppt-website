class AddExtraFieldsToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :biography, :text
    add_column :candidates, :biography_source, :string
    add_column :candidates, :link_parlamento, :string
    add_column :candidates, :photo_source, :string
  end
end
