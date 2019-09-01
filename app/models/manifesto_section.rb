# frozen_string_literal: true

class ManifestoSection < ApplicationRecord
  belongs_to :manifesto
  belongs_to :manifesto_section, optional: true

  has_many :manifesto_items

  def markdown_document
    ''
  end

  def markdown_document=(text)
    document = Kramdown::Document.new(text)
    ManifestoSectionBuilder.new(document: document, manifesto_section: self).build
  end
end
