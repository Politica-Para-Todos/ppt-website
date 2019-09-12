# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :manifesto_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :hidden

      t.timestamps
    end
  end
end
