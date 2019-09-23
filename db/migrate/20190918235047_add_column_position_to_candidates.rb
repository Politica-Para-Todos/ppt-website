# frozen_string_literal: true

class AddColumnPositionToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :position, :integer
  end
end
