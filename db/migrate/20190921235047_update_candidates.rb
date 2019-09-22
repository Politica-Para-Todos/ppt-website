# frozen_string_literal: true

class UpdateCandidates < ActiveRecord::Migration[6.0]
  def change
    add_reference :candidates, :party, index: true
    rename_column :candidates, :isLeadCandidate, :is_lead_candidate
    rename_column :candidates, :candidateType, :candidate_type
  end
end
