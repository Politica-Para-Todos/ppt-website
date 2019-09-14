# frozen_string_literal: true

class AddColumnPartyIdToManifestos < ActiveRecord::Migration[6.0]
  def change
    change_table :manifestos do |t|
      t.references :party, null: true, foreign_key: true
    end
  end
end
