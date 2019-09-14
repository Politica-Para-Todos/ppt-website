# frozen_string_literal: true

class Manifesto < ApplicationRecord
  belongs_to :party
  has_many :manifesto_sections
end
