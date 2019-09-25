# frozen_string_literal: true

class ManifestoSection < ApplicationRecord
  belongs_to :manifesto
  belongs_to :manifesto_section, optional: true

  has_many :manifesto_items
end
