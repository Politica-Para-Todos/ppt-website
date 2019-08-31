# frozen_string_literal: true

class CreateManifestos < ActiveRecord::Migration[6.0]
  def change
    create_table :manifestos do |t|
      t.string :title

      t.timestamps
    end
  end
end
