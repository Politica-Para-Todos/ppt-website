# frozen_string_literal: true

require 'digest'

class ManifestoItemBuilder
  attr_reader :manifesto_section, :element, :index, :version, :parent

  def initialize(manifesto_section:, element:, index:, version:, parent: nil)
    @manifesto_section = manifesto_section
    @element = element
    @index = index
    @version = version
    @parent = parent
  end

  def build
    case element.type
    when :header
      build_simple_manifesto_item(HeaderManifestoItem)
    when :p
      build_simple_manifesto_item(ParagraphManifestoItem)
    when :li
      build_simple_manifesto_item(ListItemManifestoItem)
    when :ol
      build_composite_manifesto_item(OrderedListManifestoItem)
    when :ul
      build_composite_manifesto_item(UnorderedListManifestoItem)
    end

    # TODO: img tags
  end

  private

  def inner_text
    case element.type
    when :li
      element.children&.first&.children&.first&.value
    else
      element.children&.first&.value
    end
  end

  def build_simple_manifesto_item(klass)
    digest = Digest::MD5.hexdigest(inner_text) if inner_text

    item = klass.find_or_create_by!(
      manifesto_section: manifesto_section,
      digest: digest
    )

    item.update!(
      parent: parent,
      version: new_version,
      position: index,
      content: inner_text
    )

    item
  end

  def build_composite_manifesto_item(klass)
    list = build_simple_manifesto_item(klass)

    element.children.each_with_index do |list_element, list_index|
      self.class.new(
        manifesto_section: manifesto_section,
        element: list_element,
        index: list_index,
        version: version,
        parent: list
      ).build
    end
  end

  def new_version
    @version + 1
  end
end
