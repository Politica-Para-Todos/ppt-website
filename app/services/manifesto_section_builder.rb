# frozen_string_literal: true

class ManifestoSectionBuilder
  attr_reader :document, :manifesto_section

  def initialize(document:, manifesto_section:)
    @document = document
    @manifesto_section = manifesto_section
  end

  def build
    document.root.children.each_with_index do |element, index|
      ManifestoItemBuilder.new(
        manifesto_section: manifesto_section,
        element: element,
        index: index,
        version: manifesto_section.version
      ).build
    end

    manifesto_section.update!(version: manifesto_section.version + 1)
  end
end
