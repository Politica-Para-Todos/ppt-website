class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :district
      t.string :photo
      t.text :description
      t.string :description_source
      t.boolean :isLeadCandidate
      t.string :candidateType

      t.timestamps
    end
  end
end
