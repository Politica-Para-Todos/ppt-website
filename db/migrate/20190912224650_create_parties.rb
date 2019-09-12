# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :acronym
      t.string :logo
      t.string :name
      t.string :website
      t.string :email
      t.text :description
      t.string :description_source
      t.date :description_updated_at
      t.string :facebook
      t.string :twitter
      t.string :instagram

      t.timestamps
    end
  end
end
