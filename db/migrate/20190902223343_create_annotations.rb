class CreateAnnotations < ActiveRecord::Migration[6.0]
  def change
    create_table :annotations do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :manifesto_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
