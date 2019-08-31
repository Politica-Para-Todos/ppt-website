# frozen_string_literal: true

class ManifestoItem < ApplicationRecord
  belongs_to :manifesto_section
end
