# frozen_string_literal: true

class ManifestoSection < ApplicationRecord
  belongs_to :manifesto
  belongs_to :manifesto_section, optional: true

  has_many :manifesto_items

  #after_save :generate_manifesto_items

  #def generate_manifesto_items
  #  return unless document_source && document_source_previously_changed?
  #
  #  ManifestoSectionBuilder.new(
  #    document: Kramdown::Document.new(document_source),
  #    manifesto_section: self
  #  ).build
  #end
end
